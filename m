Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F1916A9ABB4
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Apr 2025 13:28:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9AED2C78F68;
	Thu, 24 Apr 2025 11:28:12 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8BED7C7803A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 11:28:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3AD1F43A07;
 Thu, 24 Apr 2025 11:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1745494091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bz9b9HTv2sWKqYaZLjCkIaHyjCRTMEZ4N5CM7lBAIjs=;
 b=WTO+fOKy08+k3R6VOo4FgIrrMPsiB/nAVAOfJMQAdVSxjWQogtIY5cFgPAk1SOOSNg84v5
 YAycUQfirISNqB46b6Rq2Kb0/kVJ/dVEDf6CJhl7XDUG4q1uUDmCk208gBMtVQ1QLCcowA
 g+fPgfDstAalRZjliFX6HSgfLCdZRZcUtPau+3ZpOneb+uQBqfC5TO3g1NgDEjHo5A2vBl
 J+gh7wITo8g5J8vLAI13NXWX+GLjyMQP1oVXIARzj/ipCf1WquNYUKY8S/ZYFKBK0oZlOQ
 bt2f1BodPSa+XQVEebdOJs0qRrfqWeThlK3iYiydfl+WN4DaUXnuKi9a5EyTRA==
Date: Thu, 24 Apr 2025 13:28:04 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <20250424132804.30bcc49a@booty>
In-Reply-To: <6b699329-8ed4-4be6-81bb-17b4bf800d34@ideasonboard.com>
References: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
 <20250407-drm-bridge-convert-to-alloc-api-v1-29-42113ff8d9c0@bootlin.com>
 <6b699329-8ed4-4be6-81bb-17b4bf800d34@ideasonboard.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeelfeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedvpdhrtghpthhtohepthhomhhirdhvrghlkhgvihhnvghnsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopegrshhrihhvrghtshesrhgvughhrghtrdgtohhmpdhrtghpthhtohepphgruhhlkhesshihshdqs
 ggrshgvrdhiohdprhgtphhtthhopehluhhmrghgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdprhgtphhtthhopefjuhhirdfruhesghgvhhgvrghlthhhtggrrhgvrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com
Cc: imx@lists.linux.dev, Douglas Anderson <dianders@chromium.org>,
 =?UTF-8?B?SGVy?= =?UTF-8?B?dsOp?= Codina <herve.codina@bootlin.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 David Airlie <airlied@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Simona Vetter <simona@ffwll.ch>, chrome-platform@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Anusha Srivatsa <asrivats@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Paul Kocialkowski <paulk@sys-base.io>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-mediatek@lists.infradead.org,
 Hui Pu <Hui.Pu@gehealthcare.com>, linux-amlogic@lists.infradead.org,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, asahi@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Subject: Re: [Linux-stm32] [PATCH 29/34] drm: zynqmp_dp: convert to
 devm_drm_bridge_alloc() API
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

Hello Tomi,

On Wed, 16 Apr 2025 15:31:41 +0300
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:

> Hi,
> 
> On 07/04/2025 17:23, Luca Ceresoli wrote:
> > This is the new API for allocating DRM bridges.
> > 
> > This driver has a peculiar structure. zynqmp_dpsub.c is the actual driver,
> > which delegates to a submodule (zynqmp_dp.c) the allocation of a
> > sub-structure embedding the drm_bridge and its initialization, however it
> > does not delegate the drm_bridge_add(). Hence, following carefully the code
> > flow, it is correct to change the allocation function and .funcs assignment
> > in the submodule, while the drm_bridge_add() is not in that submodule.
> > 
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

[...]

> To add to my last mail, this clearly cannot be right, as it changes 
> kzalloc call to devm_* call, without removing the kfree()s...

Thank you very much for having tested this patch and found the mistake!
I have checked all other patches in the series and found no other
instance of this specific flaw, but a couple flaws of a different
nature. I'm now fixing all of them and will send v2 later today.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
