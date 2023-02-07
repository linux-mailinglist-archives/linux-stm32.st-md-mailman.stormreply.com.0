Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E36068D5AA
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Feb 2023 12:38:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2887FC6A5E6;
	Tue,  7 Feb 2023 11:38:57 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6BE44C035BB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Feb 2023 11:38:55 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id c13so624968ejz.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Feb 2023 03:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ypYaAIHbgwskXP956yUIa5G6SVK0QZ0JGeu03YaQuLg=;
 b=j50wXizpSCgbltXPzxLm6o6EgUCwunOa3gUhOObCfsxS5zVmzaK1bbvvNUqvbd5N59
 s38vLv0Ysjzb1iVZ1HiJGnplkCzTNqrii67ZhGZXcM6Nm93vBAaQpk0h4FApJ7wqBa7u
 z1jm04ciGE4gBk8tYyYecFTbO6F4uEiBi5Tw5VGhyW22YPsF64IrPcOj1SWTrQ1HmnaR
 f1ZNfG5UyLxIsSMw97PSgxOcFcN3yaX6IUcuonLpJGDzhifWcbo3vsJl4sdNKHkP4cqW
 e+BPGiI5s6QzdCrSLCvvb05XtqKa5znj4Ell/XC4ul+ptUNQ8iQMRC0qxgFDioXRQMOq
 8B3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ypYaAIHbgwskXP956yUIa5G6SVK0QZ0JGeu03YaQuLg=;
 b=HMym4Hwd/HLTj0OmPTx067UPECbfm6RnqRWPNNKMu3CjoN19S36L0JsejhSptOibGV
 OTol4/saofeSlj/w38Ui5s1E8IhghLy1ReXbj5zHtqVdloCSYEqZ6PQUhKXzw/TfSgt2
 S+fWJrr7mpqMkE+NifwGBfQ2azQhw/E4LtqY6yB8Id7mLb7K8eiaef3DPgCG79074Mlf
 QT9BGmztOenfbvdbGr0ay1StWtorE/l1IRi2PFN73YV0MVqQfNjUS7E+ALy/2r0IO9R0
 iL8TRLHDc+ZwNnkiI0SNbIwO8QXOY6jHIPGBM8OECXY0HOKK08zf5/0TyQ3X0o4EqQ3c
 UE2g==
X-Gm-Message-State: AO0yUKVrpi3s4nAoK0ouqdYwsDw7BFhTAjG4Uq4fs48xZJXhP8D4/rZC
 fUohqmGbn7hwdHT09FaR/lI=
X-Google-Smtp-Source: AK7set9xPPTA4AVcwID7+M8jKZFboG1ezV/PnXsBHNVtCAEcRQMGr+q/tXVvH0nFPyJttT+0/8a26A==
X-Received: by 2002:a17:906:2556:b0:8aa:1eb2:a806 with SMTP id
 j22-20020a170906255600b008aa1eb2a806mr1043783ejb.74.1675769934798; 
 Tue, 07 Feb 2023 03:38:54 -0800 (PST)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a056402511200b004a22ed9030csm6293794edd.56.2023.02.07.03.38.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 03:38:54 -0800 (PST)
Date: Tue, 7 Feb 2023 12:38:51 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <Y+I4S7Xt4gKDYLkw@orome>
References: <20230206153432.1017282-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20230206153432.1017282-1-daniel.lezcano@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
 Amit Kucheria <amitk@kernel.org>, Guillaume La Roque <glaroque@baylibre.com>,
 Minghao Chi <chi.minghao@zte.com.cn>, Alim Akhtar <alim.akhtar@samsung.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Fabio Estevam <festevam@gmail.com>, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "open list:RENESAS R-CAR THERMAL DRIVERS" <linux-renesas-soc@vger.kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Haowen Bai <baihaowen@meizu.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, rafael.j.wysocki@intel.com,
 Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Andy Gross <agross@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 NXP Linux Team <linux-imx@nxp.com>, ye xingchen <ye.xingchen@zte.com.cn>,
 Zhang Rui <rui.zhang@intel.com>, Thara Gopinath <thara.gopinath@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-pm@vger.kernel.org,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 "open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 "open list:THERMAL DRIVER FOR AMLOGIC SOCS"
 <linux-amlogic@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Scott Branden <sbranden@broadcom.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH] thermal: Remove core header inclusion
	from drivers
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
Content-Type: multipart/mixed; boundary="===============1926435382751187055=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1926435382751187055==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6YmCx3uIqlMso1fF"
Content-Disposition: inline


--6YmCx3uIqlMso1fF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 06, 2023 at 04:34:29PM +0100, Daniel Lezcano wrote:
> As the name states "thermal_core.h" is the header file for the core
> components of the thermal framework.
>=20
> Too many drivers are including it. Hopefully the recent cleanups
> helped to self encapsulate the code a bit more and prevented the
> drivers to need this header.
>=20
> Remove this inclusion in every place where it is possible.
>=20
> Some other drivers did a confusion with the core header and the one
> exported in linux/thermal.h. They include the former instead of the
> latter. The changes also fix this.
>=20
> The tegra/soctherm driver still remains as it uses an internal
> function which need to be replaced.
>=20
> The Intel HFI driver uses the netlink internal framework core and
> should be changed to prevent to deal with the internals.
>=20
> No functional changes
>=20
> [ Applies to thermal/linux-next or linux-pm/linux-next ]
>=20
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
>  drivers/thermal/amlogic_thermal.c           | 1 -
>  drivers/thermal/armada_thermal.c            | 2 --
>  drivers/thermal/broadcom/bcm2835_thermal.c  | 1 -
>  drivers/thermal/hisi_thermal.c              | 3 +--
>  drivers/thermal/imx8mm_thermal.c            | 1 -
>  drivers/thermal/imx_sc_thermal.c            | 1 -
>  drivers/thermal/intel/intel_hfi.c           | 3 ++-
>  drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 1 -
>  drivers/thermal/qoriq_thermal.c             | 1 -
>  drivers/thermal/rcar_gen3_thermal.c         | 1 -
>  drivers/thermal/samsung/exynos_tmu.c        | 3 +--
>  drivers/thermal/st/stm_thermal.c            | 1 -
>  drivers/thermal/tegra/tegra30-tsensor.c     | 1 -
>  drivers/thermal/uniphier_thermal.c          | 2 --
>  14 files changed, 4 insertions(+), 18 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--6YmCx3uIqlMso1fF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmPiOEsACgkQ3SOs138+
s6GcZg//R3MQVqmdDfUAH1wSX/RKBdIAW3IEegenVrucDauuJHfqOD6w9PZ1mhvo
7sffnxqIcqDT4K1UrFfVoSEsDYYKTB/RbwaiHjr2bGR7DJbLe7diXmw2XZWJZ+gT
Oyw8I6tyWR9ixwcfP5d03Vgi5h4QHSNvlAagPwCIMoYXlC8yMeK5stM5DR2pZCRJ
ZtpT71OQa0iUf9/MP61cm1EZco7cUSbPP79b+0gkGCaEM+N9h5VRSK4wZWyDe2ED
lRwO36ATMnOzHN27cZvYLXEsGiWRLvtSwunIfOkBW2GFf3/t0KJfLNTIIzBYyYv5
7YWQWv2PWY7A2dx0DDskAmo3n+34qouc7lGd+pCJeoPASpEXbCRK5kXvVEVMcMW/
fuxqLlsBpZoNLlxmMCL7LaN0xTTK5aAI930kxr1vJXlYfwvHsXN5YUBi9f+nP3lv
k4LY4P/jgZGDJQMcjL6ysfHJ11S9yc+6mAv9D+Zd6X5sn+DitvYUbq7oH1Vid5oU
nvu13INcwRMa/Q++f6+DOv//64fPIeZctFcq1oQr8tevgECDeJ7qy4ZTPplIcLnU
cGEHqcomIPOkFfvAxYETborXcePZSFKpuYOzecg6YEhcZCtkYLcdiFuw9PoM8Kqn
CYbQQDs1EKfpKznrlpqOIiaZ1PknWjl2zK4ey9b+APu0KE5eghc=
=Zn7P
-----END PGP SIGNATURE-----

--6YmCx3uIqlMso1fF--

--===============1926435382751187055==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1926435382751187055==--
