Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E86E99253A5
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Jul 2024 08:30:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 94737C71280;
	Wed,  3 Jul 2024 06:30:03 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 979B8C6DD9E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Jul 2024 06:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1719988202; x=1751524202;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=uNhuDjLWZorDbXDOWnVhHDPlY99NnQewwMxhnvVsgtQ=;
 b=I4h885ycG8IF1gz+TjiCi74jfSFCuV+x8XKNh/VgmL5jJ2E2OAvC7oxk
 Wi1MI8tXpJWCjFslw2IzeoFBYpQXE9/52cyEn2+BiB1lPcIwFuSAJ/auw
 ZBnVzmc4L9XRRshT8OtJtmKdvUfjYfJiN+uurhMNiKFfQLXmb454ZTLSu
 ta6fWTA8+hQ9AFY0OshnT9c077z6ZKspqZ7IjvX8XNODfZXFnnYkLZmJX
 BfIcqHYgaK5RQ/pt99eXTJZYNM3WDALxAfLPqnhFm80IfokZZqeqW0S9z
 Wwu572kc+GOA4YIejcg+1l9SpKOG9DLnixWCPoDRaaOc1UhE4ke90nabg w==;
X-CSE-ConnectionGUID: uIiTarkbQoeuHwrRiGsmdg==
X-CSE-MsgGUID: 7MEjGxCjQO6357/Nmml1zg==
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; 
 d="asc'?scan'208";a="31406626"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jul 2024 23:29:52 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Jul 2024 23:29:26 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Tue, 2 Jul 2024 23:29:12 -0700
Date: Wed, 3 Jul 2024 07:28:53 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <20240703-manager-armless-b13b18c79192@wendy>
References: <20240703025850.2172008-1-quic_tengfan@quicinc.com>
 <20240703035735.2182165-1-quic_tengfan@quicinc.com>
 <7417fd8c-e852-45ee-bac9-d92921036e2f@kernel.org>
MIME-Version: 1.0
In-Reply-To: <7417fd8c-e852-45ee-bac9-d92921036e2f@kernel.org>
Cc: rafael@kernel.org, viresh.kumar@linaro.org, linus.walleij@linaro.org,
 quic_cang@quicinc.com, alim.akhtar@samsung.com, quic_rjendra@quicinc.com,
 linux-clk@vger.kernel.org, kishon@kernel.org, kernel@quicinc.com,
 bvanassche@acm.org, bartosz.golaszewski@linaro.org, jassisinghbrar@gmail.com,
 joabreu@synopsys.com, u.kleine-koenig@pengutronix.de, lpieralisi@kernel.org,
 linux@roeck-us.net, linux-pm@vger.kernel.org, avri.altman@wdc.com,
 robimarko@gmail.com, tglx@linutronix.de, quic_kbajaj@quicinc.com,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, djakov@kernel.org,
 lukasz.luba@arm.com, kw@linux.com, thara.gopinath@gmail.com,
 quic_msarkar@quicinc.com, edumazet@google.com, srinivas.kandagatla@linaro.org,
 manivannan.sadhasivam@linaro.org, quic_kaushalk@quicinc.com,
 quic_bjorande@quicinc.com, daniel.lezcano@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com, iommu@lists.linux.dev,
 ahalaney@redhat.com, linux-watchdog@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, quic_nitirawa@quicinc.com,
 linux-gpio@vger.kernel.org, quic_rohiagar@quicinc.com, bhelgaas@google.com,
 peppe.cavallaro@st.com, linux-arm-kernel@lists.infradead.org,
 neil.armstrong@linaro.org, sboyd@kernel.org, quic_tsoni@quicinc.com,
 mcoquelin.stm32@gmail.com, krzk+dt@kernel.org, ulf.hansson@linaro.org,
 quic_gurus@quicinc.com, linux-pci@vger.kernel.org, mturquette@baylibre.com,
 amitk@kernel.org, linux-phy@lists.infradead.org, will@kernel.org,
 robh@kernel.org, quic_tingweiz@quicinc.com, mantas@8devices.com,
 luca@z3ntu.xyz, danila@jiaxyga.com, pabeni@redhat.com,
 bhupesh.sharma@linaro.org, athierry@redhat.com, quic_devipriy@quicinc.com,
 conor@kernel.org, konrad.dybcio@linaro.org, abel.vesa@linaro.org,
 davem@davemloft.net, Tengfei Fan <quic_tengfan@quicinc.com>,
 otto.pflueger@abscue.de, linux-riscv@lists.infradead.org,
 quic_wcheng@quicinc.com, quic_rgottimu@quicinc.com,
 herbert@gondor.apana.org.au, linux-scsi@vger.kernel.org, joro@8bytes.org,
 vkoul@kernel.org, quic_sibis@quicinc.com, agross@kernel.org, kuba@kernel.org,
 rui.zhang@intel.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 wim@linux-watchdog.org, quic_shashim@quicinc.com, netdev@vger.kernel.org,
 andersson@kernel.org, krzysztof.kozlowski@linaro.org, quic_tdas@quicinc.com,
 dmitry.baryshkov@linaro.org, robin.murphy@arm.com, quic_aiquny@quicinc.com
Subject: Re: [Linux-stm32] [PATCH 00/47] arm64: qcom: dts: add QCS9100
	support
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
Content-Type: multipart/mixed; boundary="===============1899105638538181653=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============1899105638538181653==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5oSvLfaqEVebv1DP"
Content-Disposition: inline

--5oSvLfaqEVebv1DP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 03, 2024 at 06:45:00AM +0200, Krzysztof Kozlowski wrote:
> On 03/07/2024 05:56, Tengfei Fan wrote:
> > Introduce support for the QCS9100 SoC device tree (DTSI) and the
> > QCS9100 RIDE board DTS. The QCS9100 is a variant of the SA8775p.
> > While the QCS9100 platform is still in the early design stage, the
> > QCS9100 RIDE board is identical to the SA8775p RIDE board, except it
> > mounts the QCS9100 SoC instead of the SA8775p SoC.
>=20
> The same huge patchset, to huge number of recipients was sent twice.
> First, sorry, this is way too big. Second, it has way too many
> recipients, but this is partially a result of first point. Only
> partially because you put here dozen of totally unrelated emails. Sorry,
> that does not make even sense. See form letter at the end how this
> works. Third, sending it to everyone twice is a way to annoy them off
> twice... Fourth,
>=20
> Please split your work and do not cc dozen of unrelated folks.

One of the extra recipients is cos that of that patch I sent adding the
cache bindings to the cache entry, forgetting that that would CC the
riscv list on all cache bindings. I modified that patch to drop the riscv
list from the entry.

Cheers,
Conor.

--5oSvLfaqEVebv1DP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoTvpQAKCRB4tDGHoIJi
0iuiAP9Wgtx8LiFpImc+BXo3h8CTF/4nY5kHoihO91fC51FsogEAnEhd56PAeLdE
Uxg8sGMCKh5qjR+u3kQIZlblyU1rmwA=
=Khim
-----END PGP SIGNATURE-----

--5oSvLfaqEVebv1DP--

--===============1899105638538181653==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1899105638538181653==--
