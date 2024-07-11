Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F4792EB03
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jul 2024 16:45:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51410C6DD9D;
	Thu, 11 Jul 2024 14:45:31 +0000 (UTC)
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79813C6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jul 2024 14:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=k1; bh=X/Vu
 s3odAr0nVoUkxLttzX7Pk94wValiSx+VwO4R69w=; b=AuPvm2HYrBBxPCRmojQD
 7CRnGb08OzEAMIGsRtGo1cADF0LX2II9QCJrZUl8IaFo/ZZrZu7J+SrEBWtj60Pv
 1FkcrDPS/qIZnwEyGkXZcTAvUt2AcDbXPu9bRoCsRQVJ3yq7hI4gN1/pRnYBoxmm
 LrVreSCYG9WfR6AIcwartOTLwI8fldcBkiqrbY/9wh/UHI5zzHySLqznxmN0E27e
 CL+TVhOO2A9S47NlInzK62SsP9b7IiXAGum0KbJErYmlY66z9pmjZt/lJ/IEYVUY
 0s8pI4FRRnO0k8J6sY5OSdOg4ouZH//OI4WOka5wh84Dzu3nFqTCzDfn3u4TXjEA
 qA==
Received: (qmail 877093 invoked from network); 11 Jul 2024 16:45:16 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 11 Jul 2024 16:45:16 +0200
X-UD-Smtp-Session: l3s3148p1@33mez/kc+ORehhtW
Date: Thu, 11 Jul 2024 16:45:15 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Message-ID: <Zo_v-xk3Hh_88sNa@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
 Ajay Gupta <ajayg@nvidia.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
 Andrew Lunn <andrew@lunn.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 asahi@lists.linux.dev, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Baruch Siach <baruch@tkos.co.il>,
 Bence =?utf-8?B?Q3PDs2vDoXM=?= <bence98@sch.bme.hu>,
 Benson Leung <bleung@chromium.org>,
 Binbin Zhou <zhoubinbin@loongson.cn>, Chen-Yu Tsai <wens@csie.org>,
 Chris Brandt <chris.brandt@renesas.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 chrome-platform@lists.linux.dev,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Conghui Chen <conghui.chen@intel.com>,
 Eddie James <eajames@linux.ibm.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Hans de Goede <hdegoede@redhat.com>, Hans Hu <hanshu@zhaoxin.com>,
 Hector Martin <marcan@marcan.st>, Heiko Stuebner <heiko@sntech.de>,
 Jean Delvare <jdelvare@suse.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jochen Friedrich <jochen@scram.de>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Kamal Dasu <kamal.dasu@broadcom.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Michael Shych <michaelsh@nvidia.com>, openbmc@lists.ozlabs.org,
 Orson Zhai <orsonzhai@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Peter Korsgaard <peter@korsgaard.com>,
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
 Ray Jui <rjui@broadcom.com>, Robert Richter <rric@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Scott Branden <sbranden@broadcom.com>, Stefan Roese <sr@denx.de>,
 Sven Peter <sven@svenpeter.dev>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thor Thayer <thor.thayer@linux.intel.com>,
 Till Harbaum <till@harbaum.org>,
 Vadim Pasternak <vadimp@nvidia.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 virtualization@lists.linux.dev, Vladimir Zapolskiy <vz@mleia.com>,
 Yicong Yang <yangyicong@hisilicon.com>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <nbi3fngfcipt35gzguk2mh4zzh3vy5a5gsk7dti5smm2iimytl@drm7p2iqsinp>
MIME-Version: 1.0
In-Reply-To: <nbi3fngfcipt35gzguk2mh4zzh3vy5a5gsk7dti5smm2iimytl@drm7p2iqsinp>
Cc: Andrew Lunn <andrew@lunn.ch>, Baruch Siach <baruch@tkos.co.il>,
 Heiko Stuebner <heiko@sntech.de>, Ajay Gupta <ajayg@nvidia.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Eddie James <eajames@linux.ibm.com>, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chris Brandt <chris.brandt@renesas.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-i2c@vger.kernel.org,
 Kamal Dasu <kamal.dasu@broadcom.com>, Benson Leung <bleung@chromium.org>,
 Stefan Roese <sr@denx.de>, linux-stm32@st-md-mailman.stormreply.com,
 chrome-platform@lists.linux.dev, Peter Korsgaard <peter@korsgaard.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Samuel Holland <samuel@sholland.org>, Binbin Zhou <zhoubinbin@loongson.cn>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Sven Peter <sven@svenpeter.dev>, Jochen Friedrich <jochen@scram.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>, Ray Jui <rjui@broadcom.com>,
 linux-sunxi@lists.linux.dev, Guenter Roeck <linux@roeck-us.net>,
 Masami Hiramatsu <mhiramat@kernel.org>, Vadim Pasternak <vadimp@nvidia.com>,
 Jean Delvare <jdelvare@suse.com>, Robert Richter <rric@kernel.org>,
 Bence =?utf-8?B?Q3PDs2vDoXM=?= <bence98@sch.bme.hu>,
 Gregory CLEMENT <gregory.clement@bootlin.com>, Hans Hu <hanshu@zhaoxin.com>,
 linux-actions@lists.infradead.org, virtualization@lists.linux.dev,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Hans de Goede <hdegoede@redhat.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Orson Zhai <orsonzhai@gmail.com>,
 linux-tegra@vger.kernel.org, Yicong Yang <yangyicong@hisilicon.com>,
 Conghui Chen <conghui.chen@intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Scott Branden <sbranden@broadcom.com>, openbmc@lists.ozlabs.org,
 Thor Thayer <thor.thayer@linux.intel.com>, Hector Martin <marcan@marcan.st>,
 linux-kernel@vger.kernel.org, Michael Shych <michaelsh@nvidia.com>,
 linux-renesas-soc@vger.kernel.org, asahi@lists.linux.dev,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
 Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
 Till Harbaum <till@harbaum.org>
Subject: Re: [Linux-stm32] [PATCH v2 00/60] i2c: reword first drivers
 according to newest specification
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
Content-Type: multipart/mixed; boundary="===============8156087705935348088=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8156087705935348088==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Vk6JWgUmE7mz+Biu"
Content-Disposition: inline


--Vk6JWgUmE7mz+Biu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Thanks for this big work, at the end it turned out quite nice and
> I'm happy of the outcome!

Me too. And thanks for the enormous review work!


--Vk6JWgUmE7mz+Biu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmaP7/sACgkQFA3kzBSg
Kbbq3A/9FNY+7cgd8CU9HNabmoXmMSCsOVflmaDNapeEn/iIYZUiBBFhDcYnJczI
T429i2bK95+lup88Nhn9fzXQ4hoPFa2TuPkQ5n3M7A9hjFnAOxLmTd91uO98BfVm
8IYBr6EIu/AfX/+D6Rj1Ro1VpSwK4laze5p9WGyNjp6QIzJ+KqmRh+vf9Shg1urk
9gNjTClxMD1OjQ60X0Vr4XmDONnsK8guT/Zkkk1gtDRDC8P92Jw17/3vtuBQnwP6
S1NAFaqvdLbLKuRBsK7KwJ6oJ4sH5jq2LCiJk87GHsXnQBerXSR3AFORTQWjvEBF
6qz8rHh0/GrQklzbs/VgVlqV3NygU4D2T18NZMyLxaJAGPmDPGeL5YvcweblR0TL
yMMuXmSq7ACO+aTJgqIqt2Wx1PS4cbvSmaHUnG52eGrX28o1PgjIW5y0xGu9G5FU
Funcvt0JlI2HtC1FI2FGDsCW77U3mh3U5N5NEo7y24XPebmTVhGifj2kWp/WkA3F
UPgJdkXF0gUzDxQj3Febmvmeh3m58s+Io+3LWBncCK2eRgL4YyEaKpEegQfA43Rl
PJGODikSLI1gh/8qN/WE44DGio65TYItOJrPX3b8VwOQLCgKgwz0y+a37vy2Jd7W
X/LXLwb8txlca1gF88Bg07eWwR/jwNoHp4c/k2C80iwHtJ12Kcg=
=ribe
-----END PGP SIGNATURE-----

--Vk6JWgUmE7mz+Biu--

--===============8156087705935348088==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8156087705935348088==--
