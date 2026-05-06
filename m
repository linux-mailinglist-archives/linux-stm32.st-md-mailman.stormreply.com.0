Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FwLIqGt+2lkfAMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 06 May 2026 23:07:45 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD7B4E07B0
	for <lists+linux-stm32@lfdr.de>; Wed, 06 May 2026 23:07:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B950AC35E3C;
	Wed,  6 May 2026 21:07:44 +0000 (UTC)
Received: from mail.kernel-space.org (v2202511311555398556.powersrv.de
 [46.38.245.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58E87C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 May 2026 21:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel-space.org;
 s=s1; t=1778101662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P03wL+yRq2fhnonG0hKGi8A1NVc+WdVspICjAGZDnnM=;
 b=xNTXpScVBMmNpq6KjpNcbP5A2luevAYVXAlrWKSUV8m+Y1+kyCpJR4LVof1+DCV7wYm3SD
 L2xqe2tRGpTRdK9f/4q8HcsiPGsjx0F35c2n2kD08AyvGtd0SzvY7epjURQCJWoaz85+A8
 x3Hf0Leg3nNamgr5zgea75Ae9AOZepM=
Received: from [IPV6:2a07:7e81:7daa:0:62cf:84ff:feee:627] (<unknown>
 [2a07:7e81:7daa:0:62cf:84ff:feee:627])
 by oreshnik (OpenSMTPD) with ESMTPSA id 15c256de
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Wed, 6 May 2026 21:07:42 +0000 (UTC)
Message-ID: <a4b53dc6-e89d-46a5-b4c1-460b0d90ae30@kernel-space.org>
Date: Wed, 6 May 2026 23:07:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jonathan Cameron <jic23@kernel.org>, Arnd Bergmann <arnd@arndb.de>
References: <20260504-wip-stmark2-dac-v1-0-874c36a4910d@baylibre.com>
 <20260504-wip-stmark2-dac-v1-8-874c36a4910d@baylibre.com>
 <ef773bbd-1cf2-4cc2-96a8-fccd3355d6b1@app.fastmail.com>
 <20260506155737.6cd625a5@jic23-huawei>
Content-Language: en-US, it
From: Angelo Dureghello <angelo@kernel-space.org>
In-Reply-To: <20260506155737.6cd625a5@jic23-huawei>
Cc: Andy Shevchenko <andy@kernel.org>,
 Angelo Dureghello <adureghello@baylibre.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, Steven King <sfking@fdwdc.com>,
 linux-m68k@lists.linux-m68k.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Greg Ungerer <gerg@uclinux.org>,
 David Lechner <dlechner@baylibre.com>, Greg Ungerer <gerg@linux-m68k.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 08/10] m68k: stmark2: add mcf5441x DAC
	platform devices
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
X-Rspamd-Queue-Id: 1DD7B4E07B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[kernel-space.org : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[kernel-space.org:s=s1];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jic23@kernel.org,m:arnd@arndb.de,m:andy@kernel.org,m:adureghello@baylibre.com,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:nuno.sa@analog.com,m:sfking@fdwdc.com,m:linux-m68k@lists.linux-m68k.org,m:geert@linux-m68k.org,m:mcoquelin.stm32@gmail.com,m:gerg@uclinux.org,m:dlechner@baylibre.com,m:gerg@linux-m68k.org,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[angelo@kernel-space.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[angelo@kernel-space.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel-space.org:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.931];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,vger.kernel.org,st-md-mailman.stormreply.com,analog.com,fdwdc.com,lists.linux-m68k.org,linux-m68k.org,gmail.com,uclinux.org,lists.infradead.org];
	TAGGED_RCPT(0.00)[linux-stm32];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:email,sashiko.dev:url,kernel-space.org:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]

Hi Jonathan,

On 5/6/26 16:57, Jonathan Cameron wrote:
> On Mon, 04 May 2026 19:28:28 +0200
> "Arnd Bergmann" <arnd@arndb.de> wrote:
> 
>> On Mon, May 4, 2026, at 19:16, Angelo Dureghello wrote:
>>> @@ -94,8 +94,42 @@ static struct platform_device dspi_spi0_device = {  
>> ...
>>> +static struct resource dspi_dac1_resource[] = {
>>> +	[0] = {  
>>
>> This looks like the name has a copy-paste error: this is not
>> related to the 'dspi' controller at all but is just the dac, right?
>>
>>       Arnd
>>
> 
> https://sashiko.dev/#/patchset/20260504-wip-stmark2-dac-v1-0-874c36a4910d%40baylibre.com
> Has noted some more alongside this one.
> Seems unlikely a DAC has a bus number.
> 

that sashiko comment is not clear to me, maybe was related to the comment
i copy/pasted from dspi.

I have now fixed this as:

+static struct resource dac0_resource[] = {
+	DEFINE_RES_MEM(MCFDAC_BASE0, 0x100),
+};
+
+static struct platform_device dac0_device = {
+	.name = "mcf54415_dac",
+	.id = 0,
+	.num_resources = ARRAY_SIZE(dac0_resource),
+	.resource = dac0_resource,
+};
+
+static struct resource dac1_resource[] = {
+	DEFINE_RES_MEM(MCFDAC_BASE1, 0x100),
+};
+
+static struct platform_device dac1_device = {
+	.name = "mcf54415_dac",
+	.id = 1,
+	.num_resources = ARRAY_SIZE(dac1_resource),
+	.resource = dac1_resource,
+};
+
 static struct platform_device *stmark2_devices[] __initdata = {
 	&dspi_spi0_device,
+	&dac0_device,
+	&dac1_device,
 };

It should be fine for sashiko too.

Regards,
angelo

> Jonathan





-- Angelo

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
