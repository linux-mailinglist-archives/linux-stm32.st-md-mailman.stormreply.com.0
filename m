Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC1931FBB6
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Feb 2021 16:12:45 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BCC95C57B66;
	Fri, 19 Feb 2021 15:12:44 +0000 (UTC)
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05186C57B59
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Feb 2021 15:12:42 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 93E225801D8;
 Fri, 19 Feb 2021 10:12:41 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 19 Feb 2021 10:12:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=Emd+iGXCpjhCIuGJ6kINzMtdOjP
 Vb1dtj8cLvd3w9uQ=; b=NGfSf1xCTv59Q/62lzFrQUe3OfzHicY7PdlXFseZ+fo
 CXaps5k96MCo/y6dXa/ePCUiVr/+yd+bY0z6zZBYrTTK2YzzxM1J8iqD3y6W62cZ
 rXBdZ7f2+aX04uHfX4St/hRD2mvVDoQ+/wu5mb+Q5x907WZ9caEJ8KHfdT1nr2yD
 JLP64gaaabo7m5fSkBVWV9SDIr/uh0mJgEZZlhBIJuPlE67fksWmT4qsGXSXnPqG
 CKVo2kTnbLrkMB9P1EmlLJdgH0orL2bJxv6jphPeJpe+zESq+2OJKnDQBxs0UL06
 x/1RFeKzSAsBixLgniCd+pZnvp+IstVDQldHmokucVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Emd+iG
 XCpjhCIuGJ6kINzMtdOjPVb1dtj8cLvd3w9uQ=; b=YkCuJYja0uX4TkD2rzV21h
 g8ng0jTMGlNLgjp3ibUk89EXpzsGrxEJjWRxIIHh3CLNVbOWazk2yrYzBXJ23kBR
 4wFbAgUarW3c96/qt+aEbZfVXEvUxH9PdikMlzxmtt9xyHWiVQpqsVbo6jcEa6iJ
 S5ASjZRNk11V2LP36XYPaue+cGDQy5dTRhUanBnB/KPmSuAVAvVr8FxbpG1DM4QP
 EabMeDUOtfQ6sWdaKB/kFRqXUJOra2iCGagkBurhMfRmM3t0wgIxbfA3h4kbSzIy
 MuzVRTwFasgPMG+HDe+aFmQxFNJJYD06GCyMfq7EAN1LPbPmuQhzaHFugwqkspHQ
 ==
X-ME-Sender: <xms:ZtUvYPGywbwb_W_X_rHD8PzuY-T32APXk_hW92aAe8msQObxCrKUFQ>
 <xme:ZtUvYMXSX6H4Zazn71SMqbZfKo75Xu2WSlL0lAD23b9Owys2Pdmw7rhPL-VpNd91z
 4S9PFdrk7Wctr0bo40>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjeeigdejfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ZtUvYBIUJuioxxraj3nflffP1AzbRkhnaIOVnlX3XwS9zmyHZ2byOg>
 <xmx:ZtUvYNEjum8w0L68Xo84cpFdfo-7BdSTnTSZf3vOsIFddzRi7AVUcg>
 <xmx:ZtUvYFXKXk3ywwLCh1ihNeDgTUlKEVDBbKVFdkJQ50WK-22UnG9MHg>
 <xmx:adUvYGbtXseOPET8eQPCaGa5NONIe4S195vIixBTbFd4se4gga4qQA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id C72DF1080057;
 Fri, 19 Feb 2021 10:12:37 -0500 (EST)
Date: Fri, 19 Feb 2021 16:12:35 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <20210219151235.dsv4mujqyrzndhsn@gilmour>
References: <20210219120032.260676-1-maxime@cerno.tech>
 <20210219120032.260676-2-maxime@cerno.tech>
 <51bb5aaf-f771-020b-9a48-77d8679de6a2@suse.de>
MIME-Version: 1.0
In-Reply-To: <51bb5aaf-f771-020b-9a48-77d8679de6a2@suse.de>
Cc: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Xinliang Liu <xinliang.liu@linaro.org>, dri-devel@lists.freedesktop.org,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 Michal Simek <michal.simek@xilinx.com>, NXP Linux Team <linux-imx@nxp.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Leo Li <sunpeng.li@amd.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Roland Scheidegger <sroland@vmware.com>, Inki Dae <inki.dae@samsung.com>,
 Sean Paul <sean@poorly.run>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Zack Rusin <zackr@vmware.com>, Gerd Hoffmann <kraxel@redhat.com>,
 David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 Edmund Dea <edmund.j.dea@intel.com>, virtualization@lists.linux-foundation.org,
 Eric Anholt <eric@anholt.net>, Thierry Reding <thierry.reding@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, John Stultz <john.stultz@linaro.org>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Sandy Huang <hjc@rock-chips.com>, Yannick Fertre <yannick.fertre@st.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Brian Starkey <brian.starkey@arm.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Stefan Agner <stefan@agner.ch>,
 Melissa Wen <melissa.srw@gmail.com>, linux-tegra@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Fabio Estevam <festevam@gmail.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, amd-gfx@lists.freedesktop.org,
 Chen-Yu Tsai <wens@csie.org>, Harry Wentland <harry.wentland@amd.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Chen Feng <puck.chen@hisilicon.com>,
 Alison Wang <alison.wang@nxp.com>, spice-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomba@kernel.org>, Philippe Cornu <philippe.cornu@st.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Tian Tao <tiantao6@hisilicon.com>, Shawn Guo <shawnguo@kernel.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Paul Cercueil <paul@crapouillou.net>,
 linux-renesas-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Russell King <linux@armlinux.org.uk>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-mediatek@lists.infradead.org,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, linux-mips@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jyri Sarha <jyri.sarha@iki.fi>, Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [Linux-stm32] [PATCH v3 02/11] drm: Rename plane atomic_check
	state names
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
Content-Type: multipart/mixed; boundary="===============5499916835826766194=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5499916835826766194==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="x6inkztb7pnxs2gu"
Content-Disposition: inline


--x6inkztb7pnxs2gu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

Thanks for your review!

On Fri, Feb 19, 2021 at 03:49:22PM +0100, Thomas Zimmermann wrote:
> > diff --git a/drivers/gpu/drm/imx/ipuv3-plane.c b/drivers/gpu/drm/imx/ip=
uv3-plane.c
> > index 075508051b5f..1873a155bb26 100644
> > --- a/drivers/gpu/drm/imx/ipuv3-plane.c
> > +++ b/drivers/gpu/drm/imx/ipuv3-plane.c
> > @@ -337,12 +337,12 @@ static const struct drm_plane_funcs ipu_plane_fun=
cs =3D {
> >   };
> >   static int ipu_plane_atomic_check(struct drm_plane *plane,
> > -				  struct drm_plane_state *state)
> > +				  struct drm_plane_state *new_state)
>=20
> This function uses a different naming convention then the others?
>=20
> >   {
> >   	struct drm_plane_state *old_state =3D plane->state;

So, the function already had a variable named old_state, so I was
actually trying to make the drivers consistent here: having one variable
with old_state and new_plane_state felt weird.

The heuristic is thus to use the convention of the driver if one exists
already, and if there's none pick new_plane_state.

It makes it indeed inconsistent across drivers, but it felt more natural
to be consistent within a single driver.

Maxime

--x6inkztb7pnxs2gu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYC/VYwAKCRDj7w1vZxhR
xXb7AP9dLYZ0ol4FnTyS9ndvGPPXpijdNPtrfZDs40BKL//eEgEA8HMiYKjgufNK
Zn4QIsaErGpt9UM9/IC6ZwJ7lvoIrQ0=
=ygPX
-----END PGP SIGNATURE-----

--x6inkztb7pnxs2gu--

--===============5499916835826766194==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5499916835826766194==--
