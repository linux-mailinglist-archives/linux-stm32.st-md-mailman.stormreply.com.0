Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E928AC4B7D
	for <lists+linux-stm32@lfdr.de>; Tue, 27 May 2025 11:27:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0CBFC36B19;
	Tue, 27 May 2025 09:27:37 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 766F2C36B18
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 May 2025 09:27:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 644551FD55;
 Tue, 27 May 2025 09:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1748338055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ls+q14bBbKBSSH85R41btg1RBJN5OvsL+OQ1fnPsL30=;
 b=F8TaetyG1KRkwdnwsGP+2qn6/oOFTSaXtxLSp1w6jLX2vUC+84mLp/SeHOXMt13CrWyC5W
 5bpnUZ9ug8+YA0tkdAR6pVm2ZJU/Qfi3OLCF2F1polb7s1EuevM1diZZ7GTuzCUIXBf3pi
 NvnhXgJbEHpgWp55tKzp2Am3UoGGp75fHqkQPN/Roi5uIDraDxq70Yk0LMC0+kYZ3wL7J9
 yFyBZVyQKT9FIYeb9ztqRSDKGM4z1kkfgLjQjDx5Y0H8d3ViXjd/22DHx59KoB/kYDgZIy
 rDw0mKraSYVVaJ3uwKF3DldpjbWcRDW9Cei3KMUad2AnCYmjoiJXRVDAw9X1DA==
Date: Tue, 27 May 2025 11:27:25 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Adam Ford <aford173@gmail.com>
Message-ID: <20250527112725.3736e415@booty>
In-Reply-To: <CAHCN7xLPxmaZcOESvaU2W1gX4o1z-1A_atq4jZdrpAH5Wmht+g@mail.gmail.com>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
 <20250509-drm-bridge-convert-to-alloc-api-v3-2-b8bc1f16d7aa@bootlin.com>
 <CAHCN7xLPxmaZcOESvaU2W1gX4o1z-1A_atq4jZdrpAH5Wmht+g@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvtddtvdculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeglefffefghefhtddvfeeufeeiveekgffgleekieduteekkeetvdehudekgfdvvdenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeikedprhgtphhtthhopegrfhhorhguudejfeesghhmrghilhdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhto
 hepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com
Cc: imx@lists.linux.dev, Manikandan Muralidharan <manikandan.m@microchip.com>,
 Sasha Finkelstein <fnkl.kernel@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vitalii Mordan <mordan@ispras.ru>, Sui Jingfeng <sui.jingfeng@linux.dev>,
 Paul Kocialkowski <paulk@sys-base.io>, linux-kernel@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Guenter Roeck <groeck@chromium.org>,
 Janne Grunau <j@jannau.net>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Heiko Stuebner <heiko@sntech.de>,
 Simona Vetter <simona@ffwll.ch>, chrome-platform@lists.linux.dev,
 Krzysztof Kozlowski <krzk@kernel.org>, Robert Foss <rfoss@kernel.org>,
 David Airlie <airlied@gmail.com>, Anusha Srivatsa <asrivats@redhat.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sugar Zhang <sugar.zhang@rock-chips.com>, Liu Ying <victor.liu@nxp.com>,
 Dharma Balasubiramani <dharma.b@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Phong LE <ple@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Adrien Grassein <adrien.grassein@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-samsung-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Hui Pu <Hui.Pu@gehealthcare.com>, linux-amlogic@lists.infradead.org,
 platform-driver-x86@vger.kernel.org, Benson Leung <bleung@chromium.org>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jesse Van Gavere <jesseevg@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 freedreno@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 linux-renesas-soc@vger.kernel.org, Christoph Fritz <chf.fritz@googlemail.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 asahi@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
 Kevin Hilman <khilman@baylibre.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Andy Yan <andy.yan@rock-chips.com>, Shawn Guo <shawnguo@kernel.org>,
 Aleksandr Mishin <amishin@t-argos.ru>
Subject: Re: [Linux-stm32] [PATCH v3 02/22] drm: convert many bridge drivers
 from devm_kzalloc() to devm_drm_bridge_alloc() API
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hello Adam,

On Sun, 25 May 2025 14:40:46 -0500
Adam Ford <aford173@gmail.com> wrote:

> For: imx8mp-hdmi-pvi.c and adv7511_drv.c
> 
> Tested-by: Adam Ford <aford173@gmail.com> #imx8mp-beacon-kit

Thanks for your testing, on the v1 as well!

Sadly your Tested-by tag won't be in the commit because the patch had
already been applied, but it is useful per se, and in the records
anyway.

Kind regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
