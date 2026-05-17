Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KxICmIVCmrgwgQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 17 May 2026 21:22:10 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BD856384E
	for <lists+linux-stm32@lfdr.de>; Sun, 17 May 2026 21:22:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB1B8C87EDD;
	Sun, 17 May 2026 19:22:08 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B44E6C87ED8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 May 2026 19:22:07 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 46e09a7af769-7dcc9b506d9so1693077a34.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 May 2026 12:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1779045726; x=1779650526;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=t8oeugrZbzajef/1vQAam9ttn87tFGEQi6JKVNWh+g0=;
 b=CJAzGEAiMLlqj/pHo3uwqPS8lpO6/uiO7fQdKLZ4gRntfkaASWk4TNdvrX4eiZY5KK
 yeYc8xD5MKCddjg/EzkjOTAstWMPvQ3NtkfbJThHDm9wJ202Z1HWITYeok4crQNgbQTf
 2jfcdJoF15eEBvXaLjU6J2S4dIW+RlquJpG0pMSFm10FTKMF4C20oLUjawIbiXpUxUcY
 Pxwk72FNMfxQ64s6s2bo1GQn9j+avS5Hcxek8Iz7gnibaRFkvl9009PQID7HGswiECQj
 AWlCk0rVTXsRYJv9HDwlVuBWSoAVoxwgBDLXz57McCmDH1r8M+uK7CHzXtNbah6dkW1w
 9uxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779045726; x=1779650526;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t8oeugrZbzajef/1vQAam9ttn87tFGEQi6JKVNWh+g0=;
 b=jdmgtjJlDFPpp61suLHHBIpKA0iiiuKNi48TuFi65G96FZVlXD1Xoqrd/tE+56bSoL
 z4zIS4f3l7WnddyOOZTHf1XqcObkMLhNAuL/CBPdgKprcGCKxdfK+BsRlfmBpbDZffNf
 K9fCDp+12kHA11f7TsMJU66EwkRLy9vHG07GT7agrkHlQc2fVjTbIUZXe78zFi5Srq2a
 sM77TUdsR5fY6zC+p5itSTRnE7o7FnkbPILFEzp6m3eg8lv+HtHg31Y1sWu2ntYCrHfP
 Vkolmw2RnkcYoOkcNzfCxZJUkMumns+YRmgf3XQnXTh25X/LSpvS1GlYOwG3I1x/Ukv2
 W/EQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8aIfVNp1aNQ14+Tpg36tE/MernZl7AP6R7x+Uh1PHrstvUMMPZWlwc2kWE55bLzAM9zZL9uisGCDNNYQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwBLL7vOeBE57VXhet9NCC5LijccYGgIBX7/0rAyI9gFN8th2oN
 RBGnVA67gUzaA9jvJnzUfuCGwH2P4V3t/WNaZBfi838gcx0B10V+mVezRKJeWQAOSls=
X-Gm-Gg: Acq92OEZQRmndJ+8UwTK3ONqGeXeEUxr1fH2IK1GwGP322bejenD9uZz8T5VIRVZFYD
 BR1H5JYwb82tSNmiN+GvOl1J6UcmyacU81HpBK3idEChctJ97s+T50mGFm+sOfyM9Ojq3zOhrkR
 yJ0WCpsR69xDWp1A9X+KVXFj11c7hjBaOVCY1CNViXUnz7FAALLeaYNnGZEezfnFR/dcGYgdNFX
 hkpkf+GVchoJzDdttShH21Glndk20Vag0W3G9RIOiEWA6wUjDUD1X5WX/fADpkoxFpHvklEKZds
 xfX2tFWhpAgI0PEZwT/EkoS03SKWjm/E9UlfNT1At9B2MuDTT4JAE0YDGmvBcMD6S8bMS8mfvpV
 rjmvS9kKTKyjZaRNGUBOpqb34e3asxv5bZ0fjZ+RzEk1g79mZFhAPpvdLsCixDLqeX/kmu7MFOb
 UVaYmHA+BDAqRIZ2HZ8Dp8vR6NA6rbIwBUqKvS+WZQU7oVD2s5X+TD5SAQvb3bpn7yMMqa0mEd1
 d9YgB4dDg==
X-Received: by 2002:a05:6830:628a:b0:7e3:d199:3164 with SMTP id
 46e09a7af769-7e4f2aa4df0mr8632934a34.11.1779045726420; 
 Sun, 17 May 2026 12:22:06 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:7a4b:ddf0:f61:f58d?
 ([2600:8803:e7e4:500:7a4b:ddf0:f61:f58d])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7e55bbd10aesm6121272a34.18.2026.05.17.12.22.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 May 2026 12:22:04 -0700 (PDT)
Message-ID: <83c11e2c-9688-4cc9-b7ee-6380de30fb58@baylibre.com>
Date: Sun, 17 May 2026 14:22:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jyoti Bhayana <jbhayana@google.com>, Jonathan Cameron <jic23@kernel.org>, 
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>
References: <20260517-iio-timestamp-cleanup-v1-0-61fb908c11c7@baylibre.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260517-iio-timestamp-cleanup-v1-0-61fb908c11c7@baylibre.com>
Cc: linux-iio@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 0/8] iio: timestamp declaration cleanup
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
X-Rspamd-Queue-Id: B7BD856384E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[baylibre-com.20251104.gappssmtp.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	FREEMAIL_TO(0.00)[google.com,kernel.org,analog.com,microchip.com,bootlin.com,tuxon.dev,gmail.com,foss.st.com,chromium.org];
	FORGED_SENDER(0.00)[dlechner@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:jbhayana@google.com,m:jic23@kernel.org,m:nuno.sa@analog.com,m:andy@kernel.org,m:nicolas.ferre@microchip.com,m:alexandre.belloni@bootlin.com,m:claudiu.beznea@tuxon.dev,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:bleung@chromium.org,m:groeck@chromium.org,m:linux-iio@vger.kernel.org,m:chrome-platform@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[dlechner@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[baylibre-com.20251104.gappssmtp.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	NEURAL_SPAM(0.00)[0.704];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:mid,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Action: no action

On 5/17/26 1:17 PM, David Lechner wrote:
> While looking around the code, I noticed that there are a lot of places
> were we are manually filling all of the fields of an IIO timestamp.
> 
> This is error-prone (as seen in the first patch) and more verbose than
> it needs to be.
> 
> I went with the approach of using the existing IIO_CHAN_SOFT_TIMESTAMP()
> macro for doing a struct assignment. This does require a cast, which
> makes it a bit more verbose, but we were already doing that in to
> drivers, so I went with it anyway.
> 
> If we want to consider alternatives, we could make a iio helper function
> or macro like the first and second patches did.
> 
I should have looked harder for existing alternatives. Just found one
more that avoids the cast via a local variable (in ad4170-4.c):

	/* Add timestamp channel */
	struct iio_chan_spec ts_chan = IIO_CHAN_SOFT_TIMESTAMP(chan_num);

	st->chans[chan_num] = ts_chan;

And similar code is found in ad7192.c.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
