Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6516DA7C038
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Apr 2025 17:07:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0AF59C78F85;
	Fri,  4 Apr 2025 15:07:12 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 81FACC78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Apr 2025 15:07:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 10A8C61137;
 Fri,  4 Apr 2025 15:07:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93ED5C4CEDD;
 Fri,  4 Apr 2025 15:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743779229;
 bh=PApck01QYV/Gm3ye6uMvwA27Rqmi2H7xw7efZ8WzdfU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WIVwUz30QNkraC8Xbe2q5/YV+CRnzJXgiz5dfbAw/VNjgtceqvuhvaQfe/3Tu4/7W
 7NX6rriinaFRtTk+uq5VcbmM8sd1ZYAHSt1dceBtZZxK+II7I1aeSAfrJvHW4Rapff
 l13UNnkHR4aV+DryGxG2GXlzocwwzL/FSakfnwayYbDyhbOWqHk+PEos94TiVntBLj
 fZPblxb4W1XZFj4wYrCL6eth6KPYjbhde+GGVPqNxZ+Zkj2D8TVOfrfxJduZZFd6Da
 imfLRsiyftRIRtblv2qnh00VdRN/gg+jo1j/TngHM2gNDqKOVA3gl8ZyheRm7AybpZ
 7e93sDPzqX4EA==
Date: Fri, 4 Apr 2025 17:07:06 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <biwwcmsjatsmjdsgeiz27rfukeidkz64nfxdtdajpfp7ace4j7@5d5b5mvfoy43>
References: <20250314171451.3497789-1-fabrice.gasnier@foss.st.com>
 <20250314171451.3497789-6-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20250314171451.3497789-6-fabrice.gasnier@foss.st.com>
Cc: robh@kernel.org, conor+dt@kernel.org, daniel.lezcano@linaro.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-iio@vger.kernel.org, catalin.marinas@arm.com, lee@kernel.org,
 linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org, will@kernel.org,
 tglx@linutronix.de, jic23@kernel.org, wbg@kernel.org
Subject: Re: [Linux-stm32] [PATCH v4 5/8] pwm: stm32-lp: add support for
	stm32mp25
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
Content-Type: multipart/mixed; boundary="===============4874809862617568554=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4874809862617568554==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5sewg2xfq5x3bxnf"
Content-Disposition: inline


--5sewg2xfq5x3bxnf
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 5/8] pwm: stm32-lp: add support for stm32mp25
MIME-Version: 1.0

Hello,

On Fri, Mar 14, 2025 at 06:14:48PM +0100, Fabrice Gasnier wrote:
> Add support for STM32MP25 SoC. A new compatible has been added to the
> dt-bindings. It represents handle new features, registers and bits
> diversity.
> It isn't used currently in the driver, as matching is done by retrieving
> MFD parent data.
>=20
> New dedicated capture/compare channels has been added: e.g. a new compare
> register for channel 2. Some controls (polarity / cc channel enable) are
> handled in CCMR register on this new variant (instead of wavepol bit).
>=20
> So, Low-power timer can now have up to two PWM outputs. Use device data
> from the MFD parent to configure the number of PWM channels e.g. 'npwm'.
>=20
> Update current get_state() and apply() ops to support either:
> - one PWM channel (as on older revision, or LPTIM5 on STM32MP25)
> - two PWM channels (e.g. LPTIM1/2/3/4 on STM32MP25 that has the full
>   feature set)
> Introduce new routines to manage common prescaler, reload register and
> global enable bit.
>=20
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

I didn't do an in-depth review, but the patch looks fine to me.
It's ok for me if Lee picks this up for v6.16-rc1, so:

Acked-by: Uwe Kleine-K=F6nig <ukleinek@kernel.org>

Best regards
Uwe

--5sewg2xfq5x3bxnf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmfv9ZcACgkQj4D7WH0S
/k53Pwf/Zw3MFYpS7c/OdBkw9qirsB7YS6C3Y3MBc/vAYhYrhcxBpVevHbyFLsyW
yLhfba05+l6U2GOdtWltJUqVwzdVX8kt7J61y1jtQnRDTAExxJDwjTH+rfKSv7wO
3ZtQ9/BEO41/8sLLrZ8/eBxhG2SYgK4xBi46yR/b0Hx0/hGGPW82036L/xjxR3Cp
N5+q3kjLaDYxUIBGy/dJ5N500yM1fizFEK+ejjfR18yhcYR3bWXLoMGHsXSChnZw
3GnD89vE8w1ciehkBpbUWvjBXlFj0Qs+AUQmLAOBENriiX1OoH6+LI+qW9kqlef8
58L7lQyOAj2g1DyQ0B20iXRaCCxtCg==
=lIiW
-----END PGP SIGNATURE-----

--5sewg2xfq5x3bxnf--

--===============4874809862617568554==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4874809862617568554==--
