Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id H15tAh9swGmmHgQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 22 Mar 2026 23:24:31 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 814FA2EAFC5
	for <lists+linux-stm32@lfdr.de>; Sun, 22 Mar 2026 23:24:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2CAC4C349C4;
	Sun, 22 Mar 2026 22:24:30 +0000 (UTC)
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com
 [74.125.82.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CCF9AC35E2B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 22 Mar 2026 22:24:28 +0000 (UTC)
Received: by mail-dy1-f171.google.com with SMTP id
 5a478bee46e88-2c0ecaae7dfso6138578eec.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 22 Mar 2026 15:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1774218267; x=1774823067;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wHlux91S1pcszks5LnQqDKbd7Lhdihe1iwVw4ZIiPgU=;
 b=ZN4WdyRCSMA22/DjjB9sjBsCWekD9goZ/GN2uT+XyhaclNw6uQsuOQzv+oDJbJm3Ui
 a1USe34BaqaY51RuNIVyrO7zu4G5avrr8rIIUVeGsb5NpeN5BAQ5WHrLHPzm1duGSKob
 gbSODZudaGxtc5Y4Sd51cMYwCOKweEo5gVvgGwKN3K4/dRzOK/TLctHTJV+GVHQ4DSNT
 nMWdjHBcWB3SoPvwa5dLJ9JB8kpfwa1/Bb8x8YfmH5LFyZpDRz1cDZ3xhqy6q5d8ZVY+
 P5Tv1HkDcc6BgMIu9eNq+bzEaiTM3Lscpnwkbky9ywhpmBgIsGTGhnq9d6TtT9Yj+3GZ
 picQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774218267; x=1774823067;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wHlux91S1pcszks5LnQqDKbd7Lhdihe1iwVw4ZIiPgU=;
 b=ddDGT7+d2qpNLloMkDC521/oCxrAiAp/gRiaxwvpTUujRBi8/q+EJ6Ae0xYf/3bzhy
 t4rJh/BxMG7WNPBFZyrg+RnroB9reyHj947JikmLzO4dfHtf4WkG9ORlatHl+GH50mgk
 APgNST6JNzp8P8rLd/UvrYnI2FsQR5yi9KsvTl4vtqwgo/U4ETOsw73fih5wuJ9/Jit4
 dSCdbw7AzzBOG8roxo3iR6FpZQDZ2PIXhWxp47oOc6Knqd4l1PPt/zek5eJj8dCE14gD
 gMDNdAXBYqydZ3mkorb2Y6f9QMrxNkOsQ3GJp7tGTQFS7qreg1bs4HSTr7YuBV6Fgeon
 kOjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7JqxgriYRap9Wzj9omivXDW8ORHkV6gE0EJ5ea0v3OIb026z7EtMTSQoy/4kgEwwLv3ErjTMbxK0k8w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyAhUZvnLKY2a8MutDFnSRpT+p3CPvU7DodJDsrW0K+cCdSjRGV
 5scxAbkUNO6tVp1HsnxLTz3e80q4p705qWHIyxHe4RcLngMS9TxsZUvc
X-Gm-Gg: ATEYQzxrnKVwLz6n5mCUqhPJYNbS40D8IDDfOFqALrqP5K72wNi/RreDBxFA3bSvzbS
 KBqAs6WX9bpFOPeMmay8Ewn+JQQghmYaexCX/v67mwT+1zUzkCXRWMpjltiQ1kA++tDundyM8y4
 vN+c0N9o4Tt1/vxEUexlsqm+7BdT4ANLxpaFcxTXSfkydOAFPeuwCY4DQzkr8bEP9TdVH7hSRH9
 gD7ftGDtP8paTZwvWRBvMWMwEUba764mXhU+w0sUT+mFemSbebh4nHg16J2Nzh0oNO3jlb2D3Be
 wruE3M1cdiH3zIv3Kgqzki/NxBJBJWFT3FJHSEB8mmn0OwSZjO+eGOoExz1mdP2TKKCQakmfYN3
 KzmarZlNpKh9APceAeLXWhnofGasSl4Rc16eCXtUQEEBdmlupvtFQCoEf1HuNp8sDcn4vg3pbW6
 nJS9BAJhgOfJYcPMHtecjc2p0G+K3lv2fSp7gyd39+/2RMzUdSA+ycuUFcCOXkYbGWYhJZ5rUIS
 q8=
X-Received: by 2002:a05:7300:134a:b0:2c1:7ca:ceb1 with SMTP id
 5a478bee46e88-2c109567522mr4864099eec.6.1774218266887; 
 Sun, 22 Mar 2026 15:24:26 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:b768:22ed:3eba:aeb3])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2c10b1a88e5sm13452469eec.13.2026.03.22.15.24.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Mar 2026 15:24:26 -0700 (PDT)
Date: Sun, 22 Mar 2026 15:24:21 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Romain Gantois <romain.gantois@bootlin.com>
Message-ID: <acBr-W2ILu9tnMyd@google.com>
References: <20251209-iio-inkern-use-namespaced-exports-v2-0-9799a33c4b7f@bootlin.com>
 <20251209-iio-inkern-use-namespaced-exports-v2-2-9799a33c4b7f@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251209-iio-inkern-use-namespaced-exports-v2-2-9799a33c4b7f@bootlin.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Casey Connolly <casey.connolly@linaro.org>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-phy@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Chanwoo Choi <cw00.choi@samsung.com>,
 Chen-Yu Tsai <wens@csie.org>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 linux-input@vger.kernel.org, Orson Zhai <orsonzhai@gmail.com>,
 Zhang Rui <rui.zhang@intel.com>, David Lechner <dlechner@baylibre.com>,
 Guenter Roeck <linux@roeck-us.net>, Mariel Tinaco <Mariel.Tinaco@analog.com>,
 linux-hwmon@vger.kernel.org, Thara Gopinath <thara.gopinath@gmail.com>,
 Saravanan Sekar <sravanhome@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Matheus Castello <matheus@castello.eng.br>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
 linux-mips@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Eugen Hristev <eugen.hristev@linaro.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Iskren Chernev <me@iskren.info>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Lukasz Luba <lukasz.luba@arm.com>, linux-arm-msm@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Shevchenko <andy@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Support Opensource <support.opensource@diasemi.com>, linux-pm@vger.kernel.org,
 Sebastian Reichel <sre@kernel.org>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-mediatek@lists.infradead.org, Kevin Tsai <ktsai@capellamicro.com>,
 Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, Peter Rosin <peda@axentia.se>,
 Hans de Goede <hansg@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 2/2] iio: inkern: Use namespaced exports
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
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[dmitrytorokhov@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:romain.gantois@bootlin.com,m:daniel.lezcano@linaro.org,m:claudiu.beznea.uj@bp.renesas.com,m:casey.connolly@linaro.org,m:linux-iio@vger.kernel.org,m:linus.walleij@linaro.org,m:amitk@kernel.org,m:nuno.sa@analog.com,m:paul@crapouillou.net,m:matthias.bgg@gmail.com,m:s.nawrocki@samsung.com,m:linux-phy@lists.infradead.org,m:m.szyprowski@samsung.com,m:kishon@kernel.org,m:lars@metafoo.de,m:andriy.shevchenko@intel.com,m:zhang.lyra@gmail.com,m:rafael@kernel.org,m:thomas.petazzoni@bootlin.com,m:krzk@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:cw00.choi@samsung.com,m:wens@csie.org,m:myungjoo.ham@samsung.com,m:linux-input@vger.kernel.org,m:orsonzhai@gmail.com,m:rui.zhang@intel.com,m:dlechner@baylibre.com,m:linux@roeck-us.net,m:Mariel.Tinaco@analog.com,m:linux-hwmon@vger.kernel.org,m:thara.gopinath@gmail.com,m:sravanhome@gmail.com,m:Michael.Hennerich@analog.com,m:matheus@castello.eng.br,m:lgirdwood@gmail.com,m:linux-sound@vger.kernel.org,m:linux-mips@vger.ker
 nel.org,m:broonie@kernel.org,m:eugen.hristev@linaro.org,m:baolin.wang@linux.alibaba.com,m:me@iskren.info,m:tiwai@suse.com,m:perex@perex.cz,m:lukasz.luba@arm.com,m:linux-arm-msm@vger.kernel.org,m:angelogioacchino.delregno@collabora.com,m:andy@kernel.org,m:sebastian.reichel@collabora.com,m:support.opensource@diasemi.com,m:linux-pm@vger.kernel.org,m:sre@kernel.org,m:linux-kernel@vger.kernel.org,m:vkoul@kernel.org,m:jic23@kernel.org,m:mcoquelin.stm32@gmail.com,m:linux-mediatek@lists.infradead.org,m:ktsai@capellamicro.com,m:pali@kernel.org,m:peda@axentia.se,m:hansg@kernel.org,m:matthiasbgg@gmail.com,m:zhanglyra@gmail.com,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[61];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,bp.renesas.com,vger.kernel.org,kernel.org,analog.com,crapouillou.net,gmail.com,samsung.com,lists.infradead.org,metafoo.de,intel.com,bootlin.com,st-md-mailman.stormreply.com,csie.org,baylibre.com,roeck-us.net,castello.eng.br,linux.alibaba.com,iskren.info,suse.com,perex.cz,arm.com,collabora.com,diasemi.com,capellamicro.com,axentia.se];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 814FA2EAFC5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Dec 09, 2025 at 09:25:56AM +0100, Romain Gantois wrote:
> Use namespaced exports for IIO consumer API functions.
> 
> This will make it easier to manage the IIO export surface. Consumer drivers
> will only be provided access to a specific set of functions, thereby
> restricting usage of internal IIO functions by other parts of the kernel.
> 
> This change cannot be split into several parts without breaking
> bisectability, thus all of the affected drivers are modified at once.
> 
> Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com> # for power-supply
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>

For input:

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
