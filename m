Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D78173B2E6F
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Jun 2021 14:01:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80AB3C57196;
	Thu, 24 Jun 2021 12:01:40 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99FF8C3FADC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Jun 2021 12:01:37 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso4719289wmc.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Jun 2021 05:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=WvUvm5hWnbpKvx8lC8t4mJz6e0uKheDES6Tk0i+zY+w=;
 b=ulOl1WR6hUsemVsWu+nXQKAaF+NWBGm9rArEOLeaoN0WxBaALD4ZQdlEtLUwiyntGS
 6aCzvNYrxKlD5RcUH9is5U5vKg0MMhLQGX5wphQ1t0LH3vRbjIejDfUNRl6yOZmEdArX
 ER4/AMzQk4RBswWBd14g4JyfQMQGAaQQl4ui6PTfaGCfGogzHiHmR0HN3yKrkh/cTjSY
 DP2SS855aTgplaldxRVj7hkHvGVB5OucvNpiMP2/osl+xTvYX1oZFoe3TRDpf2HWT8kC
 VWqIAp/206jzxPaefTLjmUt197n96j5inNoBvy2OtVPTiEtJy5ooWX2wRmaQY3coNk4A
 U1/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WvUvm5hWnbpKvx8lC8t4mJz6e0uKheDES6Tk0i+zY+w=;
 b=S88Xhai9BOS+qxcL1mmQ+R+GxT0LpWUmOaYcKX/ULJAVX/53Vl7TScP/1WKptSY1pn
 +KX7MC8X95lqx8zJ2QXnyUy05AGHzDAzjn6Yb1uitCQgRcQJ32tvAKc+aLffaV/JKdwR
 CIUE0FRYcyWgthd+NntYTrfjLzWg5uC/JtbBbTofp7WNkcCspdt8zqxYkWpSYqRBOGFB
 6aRLDpPLPKEP23v81nbfbyOeAs9i9U+NfRxJEK9P7wZZ+dj/YCVYhcNlPXil4q85O/71
 HHWAOi4m+rd054CJJK12XoV8psQSv7G/rQvEda6bImzpNAFSKS1nAEzOUZve8WepjAl4
 DXOg==
X-Gm-Message-State: AOAM533p1GBdshjrysI9QQ/F2/0jsiwsioZc4jshJ4CUiSri2e4mk+sL
 QP95aci82syhHDhEplcW7TU=
X-Google-Smtp-Source: ABdhPJzn2HGsmWMVY2UrZXCNwuzUPp/4W4zcfowMlCWK89vJwbYcDL9+9zVkS5DWjagvR0lWoKHFhQ==
X-Received: by 2002:a05:600c:1c08:: with SMTP id
 j8mr3921135wms.73.1624536097480; 
 Thu, 24 Jun 2021 05:01:37 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id e3sm3089350wro.26.2021.06.24.05.01.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 05:01:36 -0700 (PDT)
Date: Thu, 24 Jun 2021 14:03:39 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <YNR0m2DJsdIW3NAZ@orome.fritz.box>
References: <20210624072916.27703-1-tzimmermann@suse.de>
 <20210624072916.27703-5-tzimmermann@suse.de>
 <87im23u1ok.fsf@intel.com>
 <b5e7729f-ed11-e9ca-386e-562feb2bd2b7@suse.de>
 <877dijtzl2.fsf@intel.com>
 <af21db75-584f-aec0-9659-d5386f27b4ea@suse.de>
MIME-Version: 1.0
In-Reply-To: <af21db75-584f-aec0-9659-d5386f27b4ea@suse.de>
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
 james.qian.wang@arm.com, linux-imx@nxp.com,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-graphics-maintainer@vmware.com,
 intel-gfx@lists.freedesktop.org, bskeggs@redhat.com, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, puck.chen@hisilicon.com, s.hauer@pengutronix.de,
 maarten.lankhorst@linux.intel.com, Jani Nikula <jani.nikula@linux.intel.com>,
 inki.dae@samsung.com, rodrigosiqueiramelo@gmail.com, john.stultz@linaro.org,
 mripard@kernel.org, laurentiu.palcu@oss.nxp.com, matthias.bgg@gmail.com,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, amd-gfx@lists.freedesktop.org, hyun.kwon@xilinx.com,
 tomba@kernel.org, jyri.sarha@iki.fi, yannick.fertre@foss.st.com,
 Xinhui.Pan@amd.com, sw0312.kim@samsung.com, hjc@rock-chips.com,
 christian.koenig@amd.com, linux-sunxi@lists.linux.dev,
 kyungmin.park@samsung.com, kieran.bingham+renesas@ideasonboard.com,
 daniel@ffwll.ch, alexander.deucher@amd.com, tiantao6@hisilicon.com,
 shawnguo@kernel.org, brian.starkey@arm.com, zackr@vmware.com,
 l.stach@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH v3 04/27] drm: Don't test for IRQ support
	in VBLANK ioctls
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
Content-Type: multipart/mixed; boundary="===============7751357269574391817=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7751357269574391817==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Lm2ZaOZ7foAeT6XX"
Content-Disposition: inline


--Lm2ZaOZ7foAeT6XX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 24, 2021 at 11:07:57AM +0200, Thomas Zimmermann wrote:
> Hi
>=20
> Am 24.06.21 um 10:51 schrieb Jani Nikula:
> > On Thu, 24 Jun 2021, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > > Hi
> > >=20
> > > Am 24.06.21 um 10:06 schrieb Jani Nikula:
> > > > On Thu, 24 Jun 2021, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > > > > diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_v=
blank.c
> > > > > index 3417e1ac7918..10fe16bafcb6 100644
> > > > > --- a/drivers/gpu/drm/drm_vblank.c
> > > > > +++ b/drivers/gpu/drm/drm_vblank.c
> > > > > @@ -1748,8 +1748,16 @@ int drm_wait_vblank_ioctl(struct drm_devic=
e *dev, void *data,
> > > > >    	unsigned int pipe_index;
> > > > >    	unsigned int flags, pipe, high_pipe;
> > > > > -	if (!dev->irq_enabled)
> > > > > -		return -EOPNOTSUPP;
> > > > > +#if defined(CONFIG_DRM_LEGACY)
> > > > > +	if  (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY))) {
> > > > > +		if (!dev->irq_enabled)
> > > > > +			return -EOPNOTSUPP;
> > > > > +	} else /* if DRIVER_MODESET */
> > > > > +#endif
> > > > > +	{
> > > > > +		if (!drm_dev_has_vblank(dev))
> > > > > +			return -EOPNOTSUPP;
> > > > > +	}
> > > >=20
> > > > Sheesh I hate this kind of inline #ifdefs.
> > > >=20
> > > > Two alternate suggestions that I believe should be as just efficien=
t:
> > >=20
> > > Or how about:
> > >=20
> > > static bool drm_wait_vblank_supported(struct drm_device *dev)
> > >=20
> > > {
> > >=20
> > > if defined(CONFIG_DRM_LEGACY)
> > > 	if  (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY)))
> > >=20
> > > 		return dev->irq_enabled;
> > >=20
> > > #endif
> > > 	return drm_dev_has_vblank(dev);
> > >=20
> > > }
> > >=20
> > >=20
> > > ?
> > >=20
> > > It's inline, but still readable.
> >=20
> > It's definitely better than the original, but it's unclear to me why
> > you'd prefer this over option 2) below. I guess the only reason I can
> > think of is emphasizing the conditional compilation. However,
> > IS_ENABLED() is widely used in this manner specifically to avoid inline
> > #if, and the compiler optimizes it away.
>=20
> It's simply more readable to me as the condition is simpler. But option 2=
 is
> also ok.

Perhaps do something like this, then:

	if (IS_ENABLED(CONFIG_DRM_LEGACY)) {
		if (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY)))
			return dev->irq_enabled;
	}

	return drm_dev_has_vblank(dev);

That's about just as readable as the variant involving the preprocessor
but has all the benefits of not using the preprocessor.

Thierry

--Lm2ZaOZ7foAeT6XX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmDUdJsACgkQ3SOs138+
s6GX9A/+JnX2q7LN8UzemTORS9HFtHwUAvUZS/tcgEtSUkLf0Sf8oIREq4vU6mR3
gZ3hsE5Hn381Tc/ec7MCrbJG09BKGgg3XM2CZetMfKaEK+rL58OZhwSihyprbqKf
uDFxqXSEKRX2mufyn2NjwLaIv7tVG8oL0jCwdW0Pj+s4rX9X1qWbU85JKZ2LFVhY
Syt9T/2kOp0Btnx6KWiezWZU7kliWtXr55PcfVfwcPmM8ISrBkLR2BT5ZBd5CJtv
sBWAgFMUBwAWbkszskSrxD1iGkmdZ7Ik0a3278+AdxEUZmL99gg3fG33CMH7Dt0Q
9c+ZouwJlyGKEPY3ZahWwNW28nYlLBH1Gojqkmrjf9MYP0uTGkEW6rKYjQWs/ZI2
Fuzmvo/i8pLhSxlYYpAFHScIQW7z6AiRNFHAq0O4eXCIFN0VK1QVRje3KrDawWVf
KOIxC08UAGY+rfOcGABxDdutsiegkLqjUYDOORbul5Jda/4kt2izbUOGKOMrS1wt
uiRoVoyw8p9jqpKMb+fNZHSWkkSHrqrUS09iyNM0eE3f8KOQwVAoExV40Hg4h2fp
1NM98icmiHuCD6BfCHJrzKeBltLOqY8nY4JwkBLzwKnWmnAFNW+6U5mSOriTV9Vz
JjFitWRGitM+/oADAzUvPspL3TTGCBzwiAUPSVsBgnTmeiseOX8=
=4o32
-----END PGP SIGNATURE-----

--Lm2ZaOZ7foAeT6XX--

--===============7751357269574391817==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7751357269574391817==--
