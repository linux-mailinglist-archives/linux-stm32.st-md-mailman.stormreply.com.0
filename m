Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8ZT3AiTNOGo1iQcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Jun 2026 07:50:28 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAF76ACD34
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Jun 2026 07:50:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=seu.edu.cn header.s=default header.b=gzs6lqpw;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=seu.edu.cn (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5891CC9AE2F;
	Mon, 22 Jun 2026 05:50:25 +0000 (UTC)
Received: from mail-m8130.xmail.ntesmail.com (mail-m8130.xmail.ntesmail.com
 [156.224.81.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28B27C7C7CB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Jun 2026 15:11:00 +0000 (UTC)
Received: from PC-202605011814.localdomain (unknown [222.191.246.242])
 by smtp.qiye.163.com (Hmail) with ESMTP id 42eee9502;
 Thu, 18 Jun 2026 23:10:55 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
To: Linus Walleij <linusw@kernel.org>
Date: Thu, 18 Jun 2026 23:10:52 +0800
Message-Id: <20260618151052.3984665-1-runyu.xiao@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAD++jLmW3vgTFryRAL24x2TbgbR1tbhjw-nFFH3askoZfSibaQ@mail.gmail.com>
References: <CAD++jLmW3vgTFryRAL24x2TbgbR1tbhjw-nFFH3askoZfSibaQ@mail.gmail.com>
MIME-Version: 1.0
X-HM-Tid: 0a9edb49020703a1kunm36f35ee6a7202
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCTB5LVkhMQhodGElMGUJISFYeHw
 5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUlVSkJKVUlPTVVJT0lZV1kWGg8SFR0UWUFZT0tIVUpLSE
 pPSExVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=gzs6lqpw8qXjSYqQdjgrqy4UbJUPryJIoyVGglA1ZVZcfxCG/eIUVOAVIzPb5PEX59uS0mPyTnv6o/4XjgTHf/Unef3VNBtVqrOhfLKbT1oN8HKDRFW0BZYcDIX/q4WC4FXp8ft1FKnO30JP/iIeQmbls/QGPs2rAlGcLiH3oi8=;
 s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1; 
 bh=ysY+8CHLH/16Skn1tWHViitmkNPIIbvlsVj2rL0JMwU=;
 h=date:mime-version:subject:message-id:from;
X-Mailman-Approved-At: Mon, 22 Jun 2026 05:50:24 +0000
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Samuel Holland <samuel@sholland.org>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-gpio@vger.kernel.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>, jianhao.xu@seu.edu.cn,
 runyu.xiao@seu.edu.cn, Chen-Yu Tsai <wens@csie.org>,
 linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] Question: pinctrl-backed GPIO set_config and
	gpio_chip::can_sleep
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [5.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[86];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[seu.edu.cn:s=default];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[seu.edu.cn : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[runyu.xiao@seu.edu.cn,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:alexandre.belloni@bootlin.com,m:mcoquelin.stm32@gmail.com,m:brgl@kernel.org,m:linux-kernel@vger.kernel.org,m:linus.walleij@linaro.org,m:samuel@sholland.org,m:claudiu.beznea@tuxon.dev,m:jernej.skrabec@gmail.com,m:nicolas.ferre@microchip.com,m:linux-gpio@vger.kernel.org,m:ludovic.desroches@microchip.com,m:jianhao.xu@seu.edu.cn,m:runyu.xiao@seu.edu.cn,m:wens@csie.org,m:linux-sunxi@lists.linux.dev,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[runyu.xiao@seu.edu.cn,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[bootlin.com,gmail.com,kernel.org,vger.kernel.org,linaro.org,sholland.org,tuxon.dev,microchip.com,seu.edu.cn,csie.org,lists.linux.dev,st-md-mailman.stormreply.com,lists.infradead.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	DKIM_TRACE(0.00)[seu.edu.cn:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DAAF76ACD34

Hi,

Thanks for checking this.

I agree that marking these memory-mapped controllers as can_sleep is too
broad if the only sleepable part is the pinctrl range lookup.  That would
make consumers treat otherwise MMIO-backed get/set paths as sleepable,
which is not the contract I want to change.

I will hold back the at91-pio4/stm32/sunxi can_sleep series and look at
the pinctrl core direction instead, specifically whether
pinctrldev_list_mutex can be replaced by a non-sleeping lock for
pinctrl_get_device_gpio_range().  That should also line up with the GPIO
direction callback case discussed in the other thread.

Thanks,
Runyu
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
