Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A48168EE7
	for <lists+linux-stm32@lfdr.de>; Sat, 22 Feb 2020 13:40:05 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20659C36B0B;
	Sat, 22 Feb 2020 12:40:05 +0000 (UTC)
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EEFCBC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 22 Feb 2020 12:40:02 +0000 (UTC)
Received: from localhost (p5486C6B7.dip0.t-ipconnect.de [84.134.198.183])
 by pokefinder.org (Postfix) with ESMTPSA id 291152C07F9;
 Sat, 22 Feb 2020 13:40:02 +0100 (CET)
Date: Sat, 22 Feb 2020 13:40:01 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Alain Volmat <alain.volmat@st.com>
Message-ID: <20200222124001.GH1716@kunai>
References: <1579795970-22319-1-git-send-email-alain.volmat@st.com>
 <1579795970-22319-4-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
In-Reply-To: <1579795970-22319-4-git-send-email-alain.volmat@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com, robh+dt@kernel.org,
 linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/5] i2c: i2c-stm32f7: add a new st,
 stm32mp15-i2c compatible
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0558476328940474034=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0558476328940474034==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KscVNZbUup0vZz0f"
Content-Disposition: inline


--KscVNZbUup0vZz0f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 23, 2020 at 05:12:48PM +0100, Alain Volmat wrote:
> Add a new stm32mp15 specific compatible to handle FastMode+
> registers handling which is different on the stm32mp15 compared
> to the stm32f7 or stm32h7.
> Indeed, on the stm32mp15, the FastMode+ set and clear registers
> are separated while on the other platforms (F7 or H7) the control
> is done in a unique register.
>=20
> Signed-off-by: Alain Volmat <alain.volmat@st.com>

Looks good (patch 2 as well). You'd only need to adapt the naming if you
change the naming in patch 1, obviously.


--KscVNZbUup0vZz0f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5RISEACgkQFA3kzBSg
KbaaDw//TvaXXxfk/UfcOGsDNuLxbiqLPHG3i6DtQPijfEd93ekH6LKIwE5kpDV2
pbsCUtpHku3mQvQyPScHSdgyMyqbd31mwDSB8waFOfG4SuNDDJXxqo5GltD62/8w
HSBfAAvF4TM58QMDIaDYokrUhVZm5BJ/Cofv2z4+jBx4uRBWC829pmxvuf/sHWbo
gti4PZZLQRMbBs6i9/7ShPsLmn4NffZ6+U2GDyVl11EmYdhOP0fMVFPgnbS/0Z7C
/xfuMFs5Cu3wyq1oHNF0//SurRD4b1YfENh87h+cjYElICT5EUZ+Yv65TPTE4Xpf
lWUGKKVcJ6nGoYOLCJOz1YoG/cRUtxSG+RCQXVAkwyHuoswOl8UrWyPUuuOh51xf
AvrobB4WbHE3Z0KtGryxl3q2XEnoA5XHQTl8vOKiPfJTQYsRTb300Oh1Ym25E2H1
Oj3iUlI2EL2VC+hleMywRQgXZLtGyNL2C2xphOmASWRBC2zVVGcrfr8eaA5V+5AU
LvFKZPIjVaLa8suLgoxqatPo7d52ZskkXpzOtKOLp5joFYxjaNxjJDRLmlGCaa4g
EcErYOqMz3SJQuV8jyG+zNrmzZh8/1oQx6u7hkKzU2c0XaPCJhtjv8dXpMYS0Eqf
eP6JDxzkRYh4GT2xc2GwLpEL9Ysy31G1yw2RhKurA6rRGHJpkMo=
=epcM
-----END PGP SIGNATURE-----

--KscVNZbUup0vZz0f--

--===============0558476328940474034==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0558476328940474034==--
