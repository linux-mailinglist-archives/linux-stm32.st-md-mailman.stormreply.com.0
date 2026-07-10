Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5JyCC3R3UGo3zgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jul 2026 06:39:16 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F84737283
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jul 2026 06:39:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=atomide.com header.s=25mailst header.b=CTaihVTY;
	dmarc=fail reason="SPF not aligned (strict)" header.from=atomide.com (policy=reject);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3DB55C8F28E;
	Fri, 10 Jul 2026 04:39:15 +0000 (UTC)
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F150CC14542
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jul 2026 04:39:13 +0000 (UTC)
Received: from localhost (84-231-250-126.elisa-mobile.fi [84.231.250.126])
 by mail5.25mail.st (Postfix) with ESMTPSA id C8E32617B5;
 Fri, 10 Jul 2026 04:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=atomide.com;
 s=25mailst; t=1783658352;
 bh=jp+8+5QI95ophkzdeX5PhLSIZp16xbFMwu4QDRkzOEs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CTaihVTY3xKeYwYurPIj1PGrGR+oQrwQf6TQ4FUpfmbKGRQQH/0vBl8OOK/WUw/zr
 +CHCGjc9WZ0h+gMjDXgKIuG0sfG5b8v/fURlsq3junjLdDh4yjLeo/E3mnyZF5ILb5
 0L9YsyLyaxt3ROVT6g7hv2fvRb3jKJLKIJ+xGvLZkROMhpsQ6xMpDQn/A0jBZLmU4Z
 ZO8Iro9rshL2Y66OWXG4Ngkys+C/yPaKUbK202WNo4t9V08TAI3OILwZ+ejHZzDyNG
 eSqlieskQg4bhu+Sw3PZD6vdc9fq9daM5LBBKO5PSTb9Angg33oCQkJipqydJDwaNj
 eyyRZriX8WpVQ==
Date: Fri, 10 Jul 2026 07:37:46 +0300
From: Tony Lindgren <tony@atomide.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID: <20260710043746.GM30058@atomide.com>
References: <20260709-add_return_check_for_uart_change_pm-v1-0-e85c6ffa8ec4@oss.qualcomm.com>
 <ak9OPNcVAhkfxHvZ@ashevche-desk.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ak9OPNcVAhkfxHvZ@ashevche-desk.local>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 bjorn.andersson@oss.qualcomm.com, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
 chandana.chiluveru@oss.qualcomm.com, Alim Akhtar <alim.akhtar@samsung.com>,
 Peter Korsgaard <jacmet@sunsite.dk>, Jiri Slaby <jirislaby@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org,
 aniket.randive@oss.qualcomm.com, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Praveen Talari <praveen.talari@oss.qualcomm.com>, linux-serial@vger.kernel.org,
 Orson Zhai <orsonzhai@gmail.com>, linux-mips@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-omap@vger.kernel.org,
 Michal Simek <michal.simek@amd.com>,
 Richard Genoud <richard.genoud@bootlin.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH 0/6] tty: serial: propagate errors from
 uart_ops.pm callback
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
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[atomide.com : SPF not aligned (strict),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[atomide.com:s=25mailst];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:alexandre.belloni@bootlin.com,m:bjorn.andersson@oss.qualcomm.com,m:claudiu.beznea@tuxon.dev,m:mukesh.savaliya@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:alim.akhtar@samsung.com,m:jacmet@sunsite.dk,m:jirislaby@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-samsung-soc@vger.kernel.org,m:aniket.randive@oss.qualcomm.com,m:aaro.koskinen@iki.fi,m:zhang.lyra@gmail.com,m:jmkrzyszt@gmail.com,m:linux@armlinux.org.uk,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:praveen.talari@oss.qualcomm.com,m:linux-serial@vger.kernel.org,m:orsonzhai@gmail.com,m:linux-mips@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:baolin.wang@linux.alibaba.com,m:ilpo.jarvinen@linux.intel.com,m:matthias.bgg@gmail.com,m:linux-omap@vger.kernel.org,m:michal.simek@amd.com,m:richard.genoud@bootlin.com,m:linux-arm-kernel@lists.infradead.org,m:angelogioacchino.delregno@collabora.com,m:konrad.dybcio
 @oss.qualcomm.com,m:tsbogend@alpha.franken.de,m:gregkh@linuxfoundation.org,m:nicolas.ferre@microchip.com,m:linux-kernel@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:zhanglyra@gmail.com,m:matthiasbgg@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tony@atomide.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[tony@atomide.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[atomide.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[bootlin.com,oss.qualcomm.com,tuxon.dev,samsung.com,sunsite.dk,kernel.org,st-md-mailman.stormreply.com,vger.kernel.org,iki.fi,gmail.com,armlinux.org.uk,linaro.org,lists.infradead.org,linux.alibaba.com,linux.intel.com,amd.com,collabora.com,alpha.franken.de,linuxfoundation.org,microchip.com];
	TAGGED_RCPT(0.00)[linux-stm32];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A2F84737283

* Andy Shevchenko <andriy.shevchenko@linux.intel.com> [260709 10:38]:
> Just no, please just properly implement runtime PM. The .pm() must die completely.
> I used to have the PoC for that long time ago [1], but due to lack of time and
> other priorities it went abandoned. Also Atlassian made a brain damages move to
> limit repository to 1Gb, so I haven't able to update it for a few years.
> 
> Note, that Tony (you have him in the Cc list) did a lot for some corner cases
> with that and we still have them IIRC. Tony, do you know what is the state of
> affairs with runtime PM for UART?

The RX side of things should work for hardware that can wake up to an incoming
event. Linux for sure needs more work to properly handle the various corner case
TX wake-up of a PM runtime idled UART. I'm mostly offline until Monday though,
will check my notes for more details next week.

Regards,

Tony

> [1]: https://bitbucket.org/andy-shev/linux/branch/topic/uart/rpm-plus
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
