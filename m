Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFhJOYJswGmmHgQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 22 Mar 2026 23:26:10 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6B62EB00C
	for <lists+linux-stm32@lfdr.de>; Sun, 22 Mar 2026 23:26:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5338EC35E2B;
	Sun, 22 Mar 2026 22:26:10 +0000 (UTC)
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com
 [74.125.82.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D546EC349C4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 22 Mar 2026 22:26:08 +0000 (UTC)
Received: by mail-dy1-f182.google.com with SMTP id
 5a478bee46e88-2c0f754e756so3426041eec.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 22 Mar 2026 15:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1774218367; x=1774823167;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+mst3cEdRUvZvV8FPAK+ab6xPtMgdVjX2HSYh8y/2ug=;
 b=SJ6rsjr6A2fg0lEl/K1pmUThu/oudi/c6GBuJXpwuekI/1hZlCRDj5YyExJjUtqM98
 w/rUZyVcTYdsbOfqxbJFibSnkykiratdyE3cZAy8qWhLBg0yS+2Xd4jJZ6k+wzIYi79F
 DlSke03UmZBp4FCvYV4ztY+OqFSLdRMlwAVVy5s4gidVIW8b1BWQO3UtnLvDdRSr2UT8
 onHUKUSs6rGB92NtMdkQppy2x6Wkw3Kh+5EFWp6SLSaYDbWDKSyM2Z9qD4nD34/Fe7zc
 p62SYE/0YBK728YNsBbz8vFRNzzmz72/1D9aRESJ2kksSeFF4IbcStGNf/Cz9D7cAhuS
 vncQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774218367; x=1774823167;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+mst3cEdRUvZvV8FPAK+ab6xPtMgdVjX2HSYh8y/2ug=;
 b=YQIeym4zX7KdCIp+kem3Q1dRK18qaJ0QLQ1gcTup3kv/Ji/gVbLrPuP/z3F9zoRpov
 DAHk4ChM+Gg6yNUPfWJUMMy8kodLsihvCN0NrSbHdSEmsKsuEmeOPx0c9yVTCceAioZA
 r3VVZnDPH7zjE/2bwDGMExQkxARYcBXMS/z/hje1MC11SlQDLwZJjG9J01MeFiavWu6W
 duXNNiWksVKDxWotLTJ0hdwyZpV/mOdxMcuMaSGYlPxfDic1PBFb7AVcWdCAUogoWqqO
 Z1nCLX462ie8IrOCsFFBpXZ2nY/ujHE1eUd9ZvfUZvXYp3zxz1yX1Mk8zKuxEJa07BY2
 9erA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqW896SK6tG7x/Oy3rR31FVI/TbWKhfmK/nxBM7ny5h4ASeZ5yvU2R9/II0gc1InDECa2aHmAu4+hWtw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzghfMnsDREPcftsbby3mdVTHaXYdmjyywFZazvhi5TEgGXpxXX
 NHwTLa5Sj/7fjM7cmykY5uCxJtNiKGzMQDkk8BK7htUv19244fJr6GlB
X-Gm-Gg: ATEYQzz5V1VxKIf2x63G3VDmOdSAiUlkUICixweuasA7yY5eFHaQz+09SB6gL9OHS+b
 wbOkZOG7W4oJ+yhM+vTwMd1TMi7lQgAulJuhr/t3ZukyUaGHg9jy/lYlMKliIAcD09B3+Swy579
 Bd9hdf4mitZ8AYukPC5bW7UDoZv7OJz+vSq4Kt/slU5yfxNbiLQIpruhATDb1niJegjMLjsyLS8
 8F6gfpDS62wPM2xrcgJgp0TiCE5I48KPgubRZzjqK5pgQU5TU0UlFy/5T/BubwujH/tmk/dJoAx
 D9OXMx/AZUaFkTxIj7B3COK31Dvx47QGi8FtxmClGF8himadZaXaNyhw/n6fgwy9xIHPWOjcThF
 z95B9JEty1ihXtknxeKpSy4LF3u8xvPdWI3oZvfoI0EsTVKhdsCmpVq63q/3iEhRtmmO0k+CuiA
 Ht8bIM9g49n020gvcI8XDYgHYKkLhPOPP4BsIiAO7h5mA82U5p/LcehUPQ3DKBMUCZ
X-Received: by 2002:a05:7300:aca2:b0:2c0:be45:6815 with SMTP id
 5a478bee46e88-2c10981e483mr3694786eec.32.1774218367042; 
 Sun, 22 Mar 2026 15:26:07 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:b768:22ed:3eba:aeb3])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2c10b31bef1sm13678234eec.26.2026.03.22.15.26.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Mar 2026 15:26:06 -0700 (PDT)
Date: Sun, 22 Mar 2026 15:26:01 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Message-ID: <acBsI0PxvxDGymCa@google.com>
References: <20251209-iio-inkern-use-namespaced-exports-v2-0-9799a33c4b7f@bootlin.com>
 <20251209-iio-inkern-use-namespaced-exports-v2-2-9799a33c4b7f@bootlin.com>
 <20260111170222.43aee69a@jic23-huawei>
 <20260322122529.62093f12@jic23-huawei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260322122529.62093f12@jic23-huawei>
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
 Romain Gantois <romain.gantois@bootlin.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Chanwoo Choi <cw00.choi@samsung.com>,
 Chen-Yu Tsai <wens@csie.org>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 linux-input@vger.kernel.org, Orson Zhai <orsonzhai@gmail.com>,
 Zhang Rui <rui.zhang@intel.com>, David Lechner <dlechner@baylibre.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
 Thara Gopinath <thara.gopinath@gmail.com>,
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
 Vinod Koul <vkoul@kernel.org>, Mariel Tinaco <Mariel.Tinaco@analog.com>,
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jic23@kernel.org,m:daniel.lezcano@linaro.org,m:claudiu.beznea.uj@bp.renesas.com,m:casey.connolly@linaro.org,m:linux-iio@vger.kernel.org,m:linus.walleij@linaro.org,m:amitk@kernel.org,m:nuno.sa@analog.com,m:paul@crapouillou.net,m:matthias.bgg@gmail.com,m:s.nawrocki@samsung.com,m:linux-phy@lists.infradead.org,m:m.szyprowski@samsung.com,m:kishon@kernel.org,m:lars@metafoo.de,m:andriy.shevchenko@intel.com,m:romain.gantois@bootlin.com,m:zhang.lyra@gmail.com,m:rafael@kernel.org,m:thomas.petazzoni@bootlin.com,m:krzk@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:cw00.choi@samsung.com,m:wens@csie.org,m:myungjoo.ham@samsung.com,m:linux-input@vger.kernel.org,m:orsonzhai@gmail.com,m:rui.zhang@intel.com,m:dlechner@baylibre.com,m:linux@roeck-us.net,m:linux-hwmon@vger.kernel.org,m:thara.gopinath@gmail.com,m:sravanhome@gmail.com,m:Michael.Hennerich@analog.com,m:matheus@castello.eng.br,m:lgirdwood@gmail.com,m:linux-sound@vger.kernel.org,m:linux-mips@vger.kernel.org,
 m:broonie@kernel.org,m:eugen.hristev@linaro.org,m:baolin.wang@linux.alibaba.com,m:me@iskren.info,m:tiwai@suse.com,m:perex@perex.cz,m:lukasz.luba@arm.com,m:linux-arm-msm@vger.kernel.org,m:angelogioacchino.delregno@collabora.com,m:andy@kernel.org,m:sebastian.reichel@collabora.com,m:support.opensource@diasemi.com,m:linux-pm@vger.kernel.org,m:sre@kernel.org,m:linux-kernel@vger.kernel.org,m:vkoul@kernel.org,m:Mariel.Tinaco@analog.com,m:mcoquelin.stm32@gmail.com,m:linux-mediatek@lists.infradead.org,m:ktsai@capellamicro.com,m:pali@kernel.org,m:peda@axentia.se,m:hansg@kernel.org,m:matthiasbgg@gmail.com,m:zhanglyra@gmail.com,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitrytorokhov@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCPT_COUNT_GT_50(0.00)[61];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,bp.renesas.com,vger.kernel.org,kernel.org,analog.com,crapouillou.net,gmail.com,samsung.com,lists.infradead.org,metafoo.de,intel.com,bootlin.com,st-md-mailman.stormreply.com,csie.org,baylibre.com,roeck-us.net,castello.eng.br,linux.alibaba.com,iskren.info,suse.com,perex.cz,arm.com,collabora.com,diasemi.com,capellamicro.com,axentia.se];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_RCPT(0.00)[linux-stm32];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 8E6B62EB00C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 22, 2026 at 12:25:29PM +0000, Jonathan Cameron wrote:
> On Sun, 11 Jan 2026 17:02:22 +0000
> Jonathan Cameron <jic23@kernel.org> wrote:
> 
> > On Tue, 09 Dec 2025 09:25:56 +0100
> > Romain Gantois <romain.gantois@bootlin.com> wrote:
> > 
> > > Use namespaced exports for IIO consumer API functions.
> > > 
> > > This will make it easier to manage the IIO export surface. Consumer drivers
> > > will only be provided access to a specific set of functions, thereby
> > > restricting usage of internal IIO functions by other parts of the kernel.
> > > 
> > > This change cannot be split into several parts without breaking
> > > bisectability, thus all of the affected drivers are modified at once.
> > > 
> > > Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com> # for power-supply
> > > Acked-by: Guenter Roeck <linux@roeck-us.net>
> > > Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> > > Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>  
> > Ideally looking for a couple more Acks.
> > 
> > If any of the maintainers of other trees who haven't already replied
> > have time for a quick glance that would be great.  I'll spin an
> > immutable branch but I'm not really expecting any non trivial
> > conflicts unless there is a new user in flight that I've forgotten
> > about.
> 
> At this stage, given I'm still waiting on replies from a couple of
> subsystem maintainers, I'm thinking we'll do this next cycle and I'll
> provide an immutable branch based on rc1 for anyone to grab if they
> run into merge conflicts in linux-next.

Sorry, I just acked the input bits in the patch, but in general I feel
these kind of mechanical changes in consumers do not require an ack and
you can just go an apply such changes.

Thanks.

-- 
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
