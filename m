Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D67513B2E7E
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Jun 2021 14:02:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9CB13C57B51;
	Thu, 24 Jun 2021 12:02:30 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33F1FC56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Jun 2021 12:02:29 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id c84so3774837wme.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Jun 2021 05:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=+SpIYl8f+mm4xc/wATx8xxQwIh7YjYdlE5uQ7ip0aaU=;
 b=A4ZJSYnWcvNDaAGkscckQ1T0JedTdFDVSuL2YBNdwwF7acWK0AZcsU5zvsVBjaEnE0
 vsxLXeiOkPXV0sDkt5mf5/o226lI7HBeiLI3sEq1aMRGbypsf6Bch2Kg62wRL1La4pDI
 oGZydtxItkAsfL83TfuEmUWoDMxV7rufPNivK3ryBzWPLuL+5usBc6MglcCUM6IzelM8
 Nz6qtrU0C9W4JeYrs7rwBFAjukEAoFywD8y16Q8wkRFeIXm2GbxrFHrfjHBLNTda9rqV
 SY0IiWXgH48K8ZPh9MWtQ5Dh1jLdaybwti7HCY0TZjkN9TbYA/yL3MNnHzS9FYivGbwv
 lUKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+SpIYl8f+mm4xc/wATx8xxQwIh7YjYdlE5uQ7ip0aaU=;
 b=tFFxewJj0FZhhjOmzitqVX9KZ7VcIJL6QWdXklykrGlUG/lUiZNV53lLDXzIc6ReWl
 5oFLpdE07kAlPEzbIO6LBjskWcmcOYovlGzDJqHwwyUhVKviMDR1WYEjQauQR90jHDRu
 gCaC9AgRgVlPRlLRilZfCu2OlncH44EGzb/LfKZAIwaPDKQI3Da5MjpxB3UA4uQwIhj+
 ht3qcVCi2PMqE53mRoxG+qNMswhrzoyMD4HZbfGHYUongyu2KXxbaH29xtvodI2zZvNh
 QUid9BBRvIflqaokbvwDDnzxLanW02rAS9vwchH19fI7jz7cm+65JVFaPhvga6NbXQan
 8ZjA==
X-Gm-Message-State: AOAM531AeNcxtSA3Nl6zOCHNPJx7jz/l/gde2c8yu3lwqmMnN6CM3vuZ
 KxoqVVINkU8Qu8EAe/6h5Gs=
X-Google-Smtp-Source: ABdhPJwnAQpQT/2sEz7viSMJ7t/+2zmdWLWtmPK9rh67Szq5oWv4lL/lZy1xAEGpP06+iHH3w5wUNg==
X-Received: by 2002:a05:600c:4a19:: with SMTP id
 c25mr3844668wmp.125.1624536148907; 
 Thu, 24 Jun 2021 05:02:28 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id c12sm2972417wrw.46.2021.06.24.05.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 05:02:27 -0700 (PDT)
Date: Thu, 24 Jun 2021 14:04:30 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <YNR0zpVzMxQauzet@orome.fritz.box>
References: <20210624072916.27703-1-tzimmermann@suse.de>
 <20210624072916.27703-22-tzimmermann@suse.de>
MIME-Version: 1.0
In-Reply-To: <20210624072916.27703-22-tzimmermann@suse.de>
User-Agent: Mutt/2.0.7 (481f3800) (2021-05-04)
Cc: hamohammed.sa@gmail.com, heiko@sntech.de, emma@anholt.net, airlied@linux.ie,
 nouveau@lists.freedesktop.org, rodrigo.vivi@intel.com, liviu.dudau@arm.com,
 alexandre.torgue@foss.st.com, dri-devel@lists.freedesktop.org,
 michal.simek@xilinx.com, melissa.srw@gmail.com, linux-tegra@vger.kernel.org,
 laurent.pinchart@ideasonboard.com, benjamin.gaignard@linaro.org,
 linux@armlinux.org.uk, mihail.atanassov@arm.com, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org,
 jy0922.shim@samsung.com, krzysztof.kozlowski@canonical.com,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 wens@csie.org, jernej.skrabec@gmail.com, jonathanh@nvidia.com,
 xinliang.liu@linaro.org, kong.kongxinwei@hisilicon.com,
 james.qian.wang@arm.com, linux-imx@nxp.com, intel-gfx@lists.freedesktop.org,
 linux-graphics-maintainer@vmware.com, linux-sunxi@lists.linux.dev,
 bskeggs@redhat.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 puck.chen@hisilicon.com, s.hauer@pengutronix.de,
 maarten.lankhorst@linux.intel.com, Daniel Vetter <daniel.vetter@ffwll.ch>,
 mripard@kernel.org, inki.dae@samsung.com, rodrigosiqueiramelo@gmail.com,
 john.stultz@linaro.org, jani.nikula@linux.intel.com,
 laurentiu.palcu@oss.nxp.com, matthias.bgg@gmail.com, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 amd-gfx@lists.freedesktop.org, hyun.kwon@xilinx.com, tomba@kernel.org,
 jyri.sarha@iki.fi, yannick.fertre@foss.st.com, Xinhui.Pan@amd.com,
 sw0312.kim@samsung.com, hjc@rock-chips.com, christian.koenig@amd.com,
 kyungmin.park@samsung.com, kieran.bingham+renesas@ideasonboard.com,
 daniel@ffwll.ch, alexander.deucher@amd.com, tiantao6@hisilicon.com,
 shawnguo@kernel.org, brian.starkey@arm.com, zackr@vmware.com,
 l.stach@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH v3 21/27] drm/tegra: Don't set struct
 drm_device.irq_enabled
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
Content-Type: multipart/mixed; boundary="===============3315963927371761918=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3315963927371761918==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ENqalYeZVO/RAx3+"
Content-Disposition: inline


--ENqalYeZVO/RAx3+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 24, 2021 at 09:29:10AM +0200, Thomas Zimmermann wrote:
> The field drm_device.irq_enabled is only used by legacy drivers
> with userspace modesetting. Don't set it in tegra.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/tegra/drm.c | 7 -------
>  1 file changed, 7 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--ENqalYeZVO/RAx3+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmDUdM4ACgkQ3SOs138+
s6Ed0A/5ASxTJhpMIfL1u/g0kk5pjZX8ukNK72+ftE+sJWJhxDmTGuM+EzcPNaNg
sKT+65FK2YsGeoA5fnN9QKWuUyS+bpExys5n39Aty+YN4tI4CV7CbU9OJeYm9Iru
i+Ziu6gkJl2SYom/+cxuU42UkUDkQkWofYRel+HJZeDMogSRAIhiiQy5/fadGiJc
36fJrXjueiB3EZjkg7CubNsLgy08qblR+sZGpuq4RIc3aVe6j6U8QxHiZ1eA7tMD
ki2Nmub5WThcAUGn/ky+FD9m/yfieoI9sPkVWRpAF0oa6SDp6YO/oPFf2hJzl4jk
HPXABfAWIYFTEzjFkGdRHjOfGgahPAXvwd1ku5zjBuFSH3vM9kNaNRuIQe2Rg9ti
p3+b5RfPlO/1fiVRkuzXwROpjWNW44Y+eVVyee84h813aqYh9OOLJVrmxmrzZ1Xx
mzDTvyZXuxtVb79T4XSkb0LnRw3wrraylMLP1X4/QTqttUBoWgYeKM5MwDgy+6zH
Bx1VWtnjn9NmwEPfRmPpwIQNByNJ2DG/E8wZmEfeqJAEHo1SLOYaBixh9W7DUlWC
e9mZFcD+tYSTurqcg0mS5T1mSPJGyCjcZFP27RkFRSc9JbRAQt2uuKcr1R54mjTh
gAJ6mf8hPIWA8Q6ro+2TgW8p0X/wbPsnZdXjZrTGBsV1QA84k+M=
=pLLR
-----END PGP SIGNATURE-----

--ENqalYeZVO/RAx3+--

--===============3315963927371761918==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3315963927371761918==--
