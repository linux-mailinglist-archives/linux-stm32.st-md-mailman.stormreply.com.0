Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A38A9B6ED
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Apr 2025 20:59:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E20B4C78F70;
	Thu, 24 Apr 2025 18:59:41 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 133B8C78F68
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 18:59:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7AD29443A8;
 Thu, 24 Apr 2025 18:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1745521179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qAMpzkdcu4YyVXcoriylpHMenEacmOqIz6YdxYu79ZI=;
 b=JmNT1LA5zC55ZojbXdHDx0DmJrHd2HHJZ1lX5pceXf5FVQnP8XIQBgHgoVwCfXmemV8Ywc
 3dnbTrHTCh1m/p0ROnPLPqXN9Mi3N7qh8IVm/szGJeu27NaJmybtqKk0fQugGFpMOLG746
 +h92aKduZj1xdvVY6ipAMgxF2bzewMoMxPekooWmOhTaIsPQzV+xq2nkQ52KbfdB65iH8y
 8dFcvBCMcjXGCativimBTNi+4EzQNVjm/juF2w25zQ3Eq05AUQfsNE9lre1y/tDN+Nz48E
 Aq8G+wxEWeAPuqZQ2W4xH2DvTpNRqR0MlTo7wx8N/QVvYGUnXbd/4bcN9Y+sAQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 24 Apr 2025 20:59:10 +0200
MIME-Version: 1.0
Message-Id: <20250424-drm-bridge-convert-to-alloc-api-v2-3-8f91a404d86b@bootlin.com>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvhedtvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefffffgfefghfettedtfeehgfdtveekhfekudeiueetkeehleetveetjeffhedugeenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegrgeeivdemudgsuggumeeluddtudemvdelgehfnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegrgeeivdemudgsuggumeeluddtudemvdelgehfpdhhvghloheplgduledvrdduieekrddujeekrdduudekngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeggedprhgtphhtthhopehkrhiikheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehjrghgrghnsegrmhgrrhhulhgrshholhhuthhiohhnshdrtghomhdprhgtp
 hhtthhopehimhigsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheprghnugihrdihrghnsehrohgtkhdqtghhihhpshdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepnfgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrthgvkheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com
Cc: imx@lists.linux.dev, Sui Jingfeng <sui.jingfeng@linux.dev>,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, Anusha Srivatsa <asrivats@redhat.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Paul Kocialkowski <paulk@sys-base.io>, Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm@vger.kernel.org,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Andy Yan <andy.yan@rock-chips.com>, Hui Pu <Hui.Pu@gehealthcare.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, asahi@lists.linux.dev,
 linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org
Subject: [Linux-stm32] [PATCH v2 03/34] drm/bridge: analogix-anx6345:
 convert to devm_drm_bridge_alloc() API
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

VGhpcyBpcyB0aGUgbmV3IEFQSSBmb3IgYWxsb2NhdGluZyBEUk0gYnJpZGdlcy4KClNpZ25lZC1v
ZmYtYnk6IEx1Y2EgQ2VyZXNvbGkgPGx1Y2EuY2VyZXNvbGlAYm9vdGxpbi5jb20+CgotLS0KCkNj
OiAiVXdlIEtsZWluZS1Lw7ZuaWciIDx1LmtsZWluZS1rb2VuaWdAYmF5bGlicmUuY29tPgpDYzog
QW5keSBZYW4gPGFuZHkueWFuQHJvY2stY2hpcHMuY29tPgpDYzogRG1pdHJ5IEJhcnlzaGtvdiA8
ZG1pdHJ5LmJhcnlzaGtvdkBvc3MucXVhbGNvbW0uY29tPgpDYzogSmFuaSBOaWt1bGEgPGphbmku
bmlrdWxhQGludGVsLmNvbT4KQ2M6IFN1aSBKaW5nZmVuZyA8c3VpLmppbmdmZW5nQGxpbnV4LmRl
dj4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4LWFueDYzNDUu
YyB8IDggKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFs
b2dpeC1hbng2MzQ1LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4
LWFueDYzNDUuYwppbmRleCBmMmJhZmE2Y2Y3Nzk1NmVjYWZjODdhYWUzYTJiNjg5MGJkYjM2Y2Zh
Li5mM2ZlNDdiMTJlZGNhMWY5MmRkZDMwNmQxNTJiZTE0NGRmNTY0OWI1IDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4LWFueDYzNDUuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4LWFueDYzNDUuYwpAQCAtNjY0
LDkgKzY2NCwxMCBAQCBzdGF0aWMgaW50IGFueDYzNDVfaTJjX3Byb2JlKHN0cnVjdCBpMmNfY2xp
ZW50ICpjbGllbnQpCiAJc3RydWN0IGRldmljZSAqZGV2OwogCWludCBpLCBlcnI7CiAKLQlhbng2
MzQ1ID0gZGV2bV9remFsbG9jKCZjbGllbnQtPmRldiwgc2l6ZW9mKCphbng2MzQ1KSwgR0ZQX0tF
Uk5FTCk7Ci0JaWYgKCFhbng2MzQ1KQotCQlyZXR1cm4gLUVOT01FTTsKKwlhbng2MzQ1ID0gZGV2
bV9kcm1fYnJpZGdlX2FsbG9jKCZjbGllbnQtPmRldiwgc3RydWN0IGFueDYzNDUsIGJyaWRnZSwK
KwkJCQkJJmFueDYzNDVfYnJpZGdlX2Z1bmNzKTsKKwlpZiAoSVNfRVJSKGFueDYzNDUpKQorCQly
ZXR1cm4gUFRSX0VSUihhbng2MzQ1KTsKIAogCW11dGV4X2luaXQoJmFueDYzNDUtPmxvY2spOwog
CkBAIC03MzgsNyArNzM5LDYgQEAgc3RhdGljIGludCBhbng2MzQ1X2kyY19wcm9iZShzdHJ1Y3Qg
aTJjX2NsaWVudCAqY2xpZW50KQogCS8qIExvb2sgZm9yIHN1cHBvcnRlZCBjaGlwIElEICovCiAJ
YW54NjM0NV9wb3dlcm9uKGFueDYzNDUpOwogCWlmIChhbng2MzQ1X2dldF9jaGlwX2lkKGFueDYz
NDUpKSB7Ci0JCWFueDYzNDUtPmJyaWRnZS5mdW5jcyA9ICZhbng2MzQ1X2JyaWRnZV9mdW5jczsK
IAkJZHJtX2JyaWRnZV9hZGQoJmFueDYzNDUtPmJyaWRnZSk7CiAKIAkJcmV0dXJuIDA7CgotLSAK
Mi40OS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
