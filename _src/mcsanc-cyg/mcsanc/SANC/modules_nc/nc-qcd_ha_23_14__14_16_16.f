************************************************************************
* sanc_nc_v1.30 package.
************************************************************************
* File (nc-qcd_ha_23_14__14_16_16.f) is created on Wed Apr 18 13:41:21 MSK 2012.
************************************************************************
* This is the FORTRAN module (nc_qcd_ha_23_14__14_16_16) to calculate
* differential cross-section of the gluon induced
* g + dn -> dn + mo^+ + mo^- process.
*
* It is produced by s2n package of SANC (v1.10) Project.
* Copyright (C), SANC Project Team, 2002-2012.
*
* http://sanc.jinr.ru/
* http://pcphsanc.cern.ch/
* E-mail: <sanc@jinr.ru>
************************************************************************
      subroutine nc_qcd_ha_23_14__14_16_16 (s,spr,ph3,costh3,costh5,hard)
      implicit none!
      include 's2n_declare.h'

      real*8 kappaz,sq,sqspr
      real*8 a1z,a2z,v1z,v2z,vaz
      real*8 p1p2,p1p3,p1p4,p1p5,p2p3,p2p4,p2p5,p3p4,p3p5,p4p5
      real*8 ph3,cosph3,sinph3,costh3,costh5,sinth3,sinth5
      complex*16 chizspr,chizsprc
      real*8 sqrtlsdnspr,isqrtlsdnspr
      real*8 betasprmomo,ibetasprmomo
      real*8 iz1dn,iz2dn
      real*8 v0spr,a0spr,vaspr

      cmz2 = mz2

      sq = dsqrt(s)
      sqspr = dsqrt(spr)

      cosph3 = dcos(ph3)
      sinph3 = dsin(ph3)
      sinth3 = dsqrt(1d0-costh3**2)
      sinth5 = dsqrt(1d0-costh5**2)

      kappaz   = gf*rzm2/(dsqrt(2d0)*8d0*pi)/alpha
      if (irun.eq.0) then
         chizspr = 4d0*kappaz*spr/(spr-cmz2)
      else
         chizspr = 4d0*kappaz*spr/(spr-dcmplx(mz**2,-spr*wz/mz))
      endif
      chizsprc = dconjg(chizspr)

      a1z = adn*amo
      a2z = 4d0*vdn*adn*vmo*amo
      v1z = vdn*vmo
      v2z = (vdn**2+adn**2)*(vmo**2+amo**2)
      vaz = (vdn**2+adn**2)*(vmo**2-amo**2)

      sqrtlsdnspr = sqrt(s**2-2d0*s*(rdnm2+spr)+(rdnm2-spr)**2)
      isqrtlsdnspr = 1d0/sqrtlsdnspr
      betasprmomo = sqrt(1d0-4d0*rmom2/spr)
      ibetasprmomo = 1d0/betasprmomo
      
      v0spr =
     & +qdn**2*qmo**2
     & +qdn*qmo*(chizspr+chizsprc)*v1z
     & +chizspr*chizsprc*v2z
      
      a0spr =
     & +qdn*qmo*(chizspr+chizsprc)*a1z
     & +chizspr*chizsprc*a2z
      
      vaspr =
     & +qdn**2*qmo**2
     & +qdn*qmo*(chizspr+chizsprc)*v1z
     & +chizspr*chizsprc*vaz

      p1p2=
     & +costh5*(-1d0/4*(s-spr))
     & +1d0/4*spr-1d0/4*s

      p1p3=
     & +costh3*(1d0/4*betasprmomo*(s-spr))
     & -1d0/8*(s-spr)+1d0/8*spr-1d0/8*s

      p1p4=
     & +costh3*(-1d0/4*betasprmomo*(s-spr))
     & -1d0/8*(s-spr)+1d0/8*spr-1d0/8*s

      p1p5=
     & +costh5*(1d0/4*(s-spr))
     & +1d0/4*spr-1d0/4*s

      p2p3=
     & +sinph3*sinth3*sinth5*(-1d0/4*betasprmomo*sq*sqspr)
     & +costh3*costh5*(-1d0/8*betasprmomo*spr-1d0/8*betasprmomo*s)
     & +costh3*(1d0/8*betasprmomo*(s-spr))
     & +costh5*(1d0/8*(s-spr))
     & -1d0/8*spr-1d0/8*s

      p2p4=
     & +sinph3*sinth3*sinth5*(1d0/4*betasprmomo*sq*sqspr)
     & +costh3*costh5*(1d0/8*betasprmomo*spr+1d0/8*betasprmomo*s)
     & +costh3*(-1d0/8*betasprmomo*(s-spr))
     & +costh5*(1d0/8*(s-spr))
     & -1d0/8*spr-1d0/8*s

      p2p5=
     & -1d0/2*s

      p3p4=
     & -1d0/2*spr+mmo**2

      p3p5=
     & +sinph3*sinth3*sinth5*(1d0/4*betasprmomo*sq*sqspr)
     & +costh3*costh5*(1d0/8*betasprmomo*spr+1d0/8*betasprmomo*s)
     & +costh3*(1d0/8*betasprmomo*(s-spr))
     & +costh5*(-1d0/8*(s-spr))
     & -1d0/8*spr-1d0/8*s

      p4p5=
     & +sinph3*sinth3*sinth5*(-1d0/4*betasprmomo*sq*sqspr)
     & +costh3*costh5*(-1d0/8*betasprmomo*spr-1d0/8*betasprmomo*s)
     & +costh3*(-1d0/8*betasprmomo*(s-spr))
     & +costh5*(-1d0/8*(s-spr))
     & -1d0/8*spr-1d0/8*s

      iz2dn=
     & +1d0/(1-mdn**2/s)*(1d0/s)

      iz1dn=
     & +1d0/(1-mdn**2/s)*1d0/(mdn**2/s+1d0/4*sqrtlsdnspr**2*sinth5**2/s*
     & *2)*(-1d0/2/s**2*spr+1d0/2/s+1d0/2*mdn**2/s**2+1d0/2*sqrtlsdnspr*
     & costh5/s**2)

      hard=
     & +v0spr*iz1dn**2*betasprmomo/pi*alpha**2*alphas/spr**2*(s-spr)*cf*
     & (-1d0/8*p1p3*p2p4*mdn**2/s**2-1d0/8*p1p4*p2p3*mdn**2/s**2+1d0/8*p
     & 2p3*p4p5*mdn**2/s**2+1d0/8*p2p4*p3p5*mdn**2/s**2)
     & +v0spr*iz1dn*betasprmomo/pi*alpha**2*alphas/spr**2*(s-spr)*cf*(-1
     & d0/4*p1p2*p1p3*p2p4/s**3-1d0/8*p1p2*p1p3*p4p5/s**3-1d0/4*p1p2*p1p
     & 4*p2p3/s**3-1d0/8*p1p2*p1p4*p3p5/s**3+1d0/8*p1p2*p2p3*p4p5/s**3+1
     & d0/8*p1p2*p2p4*p3p5/s**3-1d0/8*p1p3*p1p4/s**2-1d0/16*p1p3*p2p4/s*
     & *2-1d0/16*p1p4*p2p3/s**2+1d0/16*p2p3*p4p5/s**2+1d0/16*p2p4*p3p5/s
     & **2)
     & +v0spr*betasprmomo/pi*alpha**2*alphas/spr**2*(s-spr)*cf*(1d0/16*p
     & 1p3*p2p4/s**3+1d0/16*p1p3*p4p5/s**3+1d0/16*p1p4*p2p3/s**3+1d0/16*
     & p1p4*p3p5/s**3+1d0/8*p2p3*p2p4/s**3)
     & +a0spr*iz1dn**2*betasprmomo/pi*alpha**2*alphas/spr**2*(s-spr)*cf*
     & (-1d0/8*p1p3*p2p4*mdn**2/s**2+1d0/8*p1p4*p2p3*mdn**2/s**2-1d0/8*p
     & 2p3*p4p5*mdn**2/s**2+1d0/8*p2p4*p3p5*mdn**2/s**2)
     & +a0spr*iz1dn*betasprmomo/pi*alpha**2*alphas/spr**2*(s-spr)*cf*(-1
     & d0/4*p1p2*p1p3*p2p4/s**3-1d0/8*p1p2*p1p3*p4p5/s**3+1d0/4*p1p2*p1p
     & 4*p2p3/s**3+1d0/8*p1p2*p1p4*p3p5/s**3-1d0/8*p1p2*p2p3*p4p5/s**3+1
     & d0/8*p1p2*p2p4*p3p5/s**3-1d0/16*p1p3*p2p4/s**2+1d0/16*p1p4*p2p3/s
     & **2-1d0/16*p2p3*p4p5/s**2+1d0/16*p2p4*p3p5/s**2)
     & +a0spr*betasprmomo/pi*alpha**2*alphas/spr**2*(s-spr)*cf*(1d0/16*p
     & 1p3*p2p4/s**3+1d0/16*p1p3*p4p5/s**3-1d0/16*p1p4*p2p3/s**3-1d0/16*
     & p1p4*p3p5/s**3)
     & +vaspr*iz1dn**2*betasprmomo/pi*alpha**2*alphas/spr**2*(s-spr)*cf*
     & (1d0/8*p1p2*mdn**2*mmo**2/s**2-1d0/8*p2p5*mdn**2*mmo**2/s**2)
     & +vaspr*iz1dn*betasprmomo/pi*alpha**2*alphas/spr**2*(s-spr)*cf*(1d
     & 0/8*p1p2*mmo**2/s**2+1d0/4*p1p2**2*mmo**2/s**3-1d0/16*p2p5*mmo**2
     & /s**2)
     & +vaspr*betasprmomo/pi*alpha**2*alphas/spr**2*(s-spr)*cf*(-1d0/8*p
     & 1p2*mmo**2/s**3-1d0/16*p1p5*mmo**2/s**3)

      hard = hard*conhc

      return
      end
