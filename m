Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C13857B81
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Feb 2024 12:23:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 852DFC65E42;
	Fri, 16 Feb 2024 11:23:40 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D784C6410C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Feb 2024 11:23:39 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-511acd26c2bso2750063e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Feb 2024 03:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708082618; x=1708687418;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:references:to:from:subject:message-id:date:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qCkIBF2HUHDgPA/fkE23qtD6c+3DYAPMy1MuIjYZckA=;
 b=jrj3RtpLrKTytJVaKSYmBs7Lc7HQUxfVncwmGFDJ+EExTOHFL//b2M6J7l8cie1vGm
 XWC9FaXcC1n3oAOnb0VtE2bgbU71kTvL0PC2mEwGqZQJduJLacqLiSiMPeKgqqh8+Zgd
 wu6C45VFrIjF+AMDx8k4DNc8rPazowSEtaKJZTH93QirGKy3kEWwLzHeTtxL7/MPXWu/
 /IVQe32fKRrDeKbRaXb2InVIPQcvtfBjTFU0So7Dxhu/hQMxtTy/Zgv919ueLdHx/MNG
 WZJI0okG5v/8C2xgH5y1axKog88UvU+zxiBELcyw7gWmkv+YHroEU7b9Atiekg6aI7mA
 dnxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708082618; x=1708687418;
 h=in-reply-to:references:to:from:subject:message-id:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qCkIBF2HUHDgPA/fkE23qtD6c+3DYAPMy1MuIjYZckA=;
 b=vvzLdgJhSStMs2U6fLKRiVaRL2GtkBuR6OQJ7kYFWL6W8WaV49d6p4WOnkVYJwxuwL
 jX8Uzc9Dzcx+NTQ38NTzCXJS7ysXEpfeJqek+WScV66JF0lWqgm7UPjqOG8mX1IyazsQ
 NVBK8iwnUEnwa4wrSRRVQBhIQYPV8VLA7oDjV9dbi64mKy8zGii/7cHyxVJD/UL711Zn
 WgM4WP6QSwXcjzKNdJ4o7CnkMkBGfTBfvZFTha1AHOFU2i5YahmgEuSUaXTm9kwj6s87
 RYXh8xGfGBBCxdcSsV/rMLFCV5O1cAPuZh7Iq5tMJPw39QOTJjhFO74wNd+hbFm4l+GT
 cZYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWX+/kWFpZp/i7JNMSFaX0aFxyYB7KyZpd1zc92GM10lBgNcnl7HlE4t/7D8NOhTTSti5f6VnX2dD4aug4kIyCLlzYBGvGML6mQng8t7NaFdqb+X6p/kyDl
X-Gm-Message-State: AOJu0Yw/EY2W4GxuZlNo3pjPl/hxRO5Zt2QB9YP9DK0NPpp3oyWauhHR
 EpsLw/i79YFdDOxp12hz10ySspEbm/G8xu+YUQI4bbmhiOKJnpq3
X-Google-Smtp-Source: AGHT+IFk4ZkCa0R/m44omA2Xi3MhoAzI8tKPY8V0cTU/2axm4inHWuZNW2UcVx0PzaNks2ZutoR+ew==
X-Received: by 2002:a05:6512:716:b0:511:8b40:ab6b with SMTP id
 b22-20020a056512071600b005118b40ab6bmr2834631lfs.50.1708082618024; 
 Fri, 16 Feb 2024 03:23:38 -0800 (PST)
Received: from localhost
 (p200300e41f147f00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f14:7f00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 f23-20020a170906561700b00a3d828c54f1sm1459386ejq.135.2024.02.16.03.23.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Feb 2024 03:23:37 -0800 (PST)
Mime-Version: 1.0
Date: Fri, 16 Feb 2024 12:23:36 +0100
Message-Id: <CZ6GR5BWC80N.36XRBM33WF8MW@gmail.com>
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>, "Michael
 Turquette" <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>,
 "Sudeep Holla" <sudeep.holla@arm.com>, "Peng Fan" <peng.fan@nxp.com>,
 "Shawn Guo" <shawnguo@kernel.org>, "Nishanth Menon" <nm@ti.com>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konrad.dybcio@linaro.org>, "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Jonathan Hunter" <jonathanh@nvidia.com>, "Linus Walleij"
 <linus.walleij@linaro.org>, "Laurent Pinchart"
 <laurent.pinchart@ideasonboard.com>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Vinod Koul" <vkoul@kernel.org>, "Russell King"
 <linux@armlinux.org.uk>, "Srinivas Kandagatla"
 <srinivas.kandagatla@linaro.org>, "Mark Brown" <broonie@kernel.org>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
 <linux-stm32@st-md-mailman.stormreply.com>, "NXP Linux Team"
 <linux-imx@nxp.com>, <linux-amlogic@lists.infradead.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
 <linux-tegra@vger.kernel.org>, <linux-omap@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <linux-phy@lists.infradead.org>,
 <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240208163710.512733-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240208163710.512733-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [Linux-stm32] [PATCH] clk: constify the of_phandle_args
 argument of of_clk_provider
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
Content-Type: multipart/mixed; boundary="===============4463777968423382700=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============4463777968423382700==
Content-Type: multipart/signed;
 boundary=87caa6e717479adfa0f5d015ffee82cc14ceb938e5f7a71c46d45b7997b5;
 micalg=pgp-sha256; protocol="application/pgp-signature"

--87caa6e717479adfa0f5d015ffee82cc14ceb938e5f7a71c46d45b7997b5
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Feb 8, 2024 at 5:37 PM CET, Krzysztof Kozlowski wrote:
[...]
>  drivers/clk/tegra/clk-bpmp.c                  |  2 +-
>  drivers/clk/tegra/clk-tegra124.c              |  2 +-
>  drivers/clk/tegra/clk-tegra20.c               |  2 +-
>  drivers/clk/tegra/clk-tegra30.c               |  2 +-
[...]

Acked-by: Thierry Reding <treding@nvidia.com>

--87caa6e717479adfa0f5d015ffee82cc14ceb938e5f7a71c46d45b7997b5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmXPRbkACgkQ3SOs138+
s6FzcQ/9F5fJyakwkqSmFCFsFTUwQ0Vv6AmJP7kf0C2oOGiJISmgaFwRE7ikl73f
tfJ/jetoF3grVZE950B1ZtY1sAK6WLfAlRnkD52YE25Y+NcehSPfcE2403gBL/JZ
6Rtlw4U/jJhHC7k1NNSCV6W3YM9tFJZzPdOwWL1efc33DWZQkTgvIPKSfqGIHd0i
iclZTsusANQThdL9ASOlvq81RrglhXgo2PIt/oeGjEBtf+IoDVhHSWqJ65e/lmYV
cBw1uhHa5zHLiWoT4xTqJY8dPkSLfBSRM3uflLUkA5BRNllvVsHAPvIgR6aBpqi5
KeLdZEDFeIuIi8nqtYxhhnGa8nKz9t03MNj9GbFf9HYocIVDIV4SvKuKongDjcYZ
zr5jC3lMZnmuQIM5XOIFu8hQWG0zQ6H+Kuf6ifolHj13E5gplCo4BoZWNnE84OZ8
fMjNHraK6RNUUqJXW43OBEjejW+FvvZIpMvyyt8TcE/I7hieXCjib0Spu2n5SwvK
mQgKxPJpsOpCxIOID89cK2VwOX3uOZslT3M5sU9ZkoUcwRpQ/Ntfr7ZWW8Jy/L4Y
DWnk7IvOvI4fFlmRQONIeWpr8euHFmCL8L8dJ29AI9oB2lvs7ZovvWw9QTE8E6iU
EjVBwtdG6KqWJxP803h8DAvvD0Vsu0KzQFr+Pwre3NP2FHYDCR0=
=E0uq
-----END PGP SIGNATURE-----

--87caa6e717479adfa0f5d015ffee82cc14ceb938e5f7a71c46d45b7997b5--

--===============4463777968423382700==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4463777968423382700==--
