Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id HaM/OhSsE2r8EgcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2026 03:55:32 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D845C54AA
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2026 03:55:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A8E2C87ED4;
	Mon, 25 May 2026 01:49:15 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E2492C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2026 01:49:14 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 46e09a7af769-7de4be15125so9208359a34.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 24 May 2026 18:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre.com; s=google; t=1779673753; x=1780278553;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QSxXz0fJUl/u0yNVKSTnYM+nC+klyCfC7mCOal5YHEI=;
 b=chUc04FmRKGFRqtT09wFP5VbjS33ENFaOtb1XKKdRdOt7CHIv8hzjPiLZBSK0znfdA
 xZ6y6kIBXw8vhyvS1vw2b9CngP1P54kDIJ9z9qhUplL7kmmS6A/XPDhqv9RImgdYpCUK
 /gbtAazJC7GPzImK+AoxuxrheKaBTotQnu2NubNJfrrypLMENL5FAyw+SYPWEMLnhiOJ
 m6MEzKtnm4sed2/+mZoQZkFzvKTVHxaDtb9EYHEQdoXy1j32C7x+DjdJXmNTiagAeijS
 TvtwnexDFdBZs/JJcP9bJ6jkhd9i+61eDzd9SYzhFGx2kHFIWTIz/+fLhruLEkF/qHeX
 /dZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779673753; x=1780278553;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QSxXz0fJUl/u0yNVKSTnYM+nC+klyCfC7mCOal5YHEI=;
 b=Znghiw6Sr3CMU//DduUFxEPUUFTJcN4ShaicyrXTu1R+m0iKYzew2Vj3xGsi/la9Qc
 5wsy/9Ku4eA0nxFaMZ2ewafMPgq5IKaL0yXCEqOa0Z0jlvJjiWYFdd/Hr42CRXDOYB+X
 YVFipxEnfEk1uvdOgOSV+ejaIDcgl4VfwURWdFLpDyXQh80Xj9/WEWUHN6SZi2Y8QE/p
 ucuN0lccr2jkNmBLH2DkL71K3SNqz0pbTuYTyCY3MJ02B3WPhHP1u5mnHoGf+9/u/ac1
 r/xSBE0dtZCCueHd2zutr3dxPLZ+xzNOGOekLIh8xLgMsRGGla8KryjaHdzY78OHxQBR
 OUJA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+j94QqNjBA7atJ2ivM7+ufaUA6D9UfkHRzM3jSPLRTDu8oPMU46xScAhWEgz/qmwXulLB+bvaMFJTfTA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyCJrpnGsCX3uPeFxdhpIfAx44dUCuDhZ8Vckkls5zWTf3nc1ie
 /XBAMFQ1a2lZiiSVDn53I+Da76OK4JCF1gRFryRBOmnciTWKNAkSak5W8pAy0GT52RQ=
X-Gm-Gg: Acq92OFShLpBwEusilQzYfraobhHigctAwsbBL0WOHB+hEi2+p4L7BNwONdlZUIvfti
 eXpsAMIZdGQ327V/xKkAQu6CdjIOcw2v4g3HqefwE1Z7EtX4hqFvREf6RJa6N9FTbQ+R0+WsRvI
 djSWHoskzhGFjMbb8kpIvo5YMW9Vj5OSt2Er4j9Dx09qH1ubiYjFyfA7zZZWseUjXIbnRJrmgy7
 PCUUQLhSJ2nA4+5F8RHFQ9zgN1ritqJicXWz28t/SYrrmATdgXF6/ZNy1xD2kD8XZX0q4vDvA6Y
 PrKtGkCTvBDyjJhtmtHHBUBeyNuPFThtDJaXXgbKJOMPGr69pJ+/OTV5gujlPBBFyiM+xvWp9UT
 /9hbICahAW2OjO9bHfYXJo89Y578f6SPlE1i7+RjY+gzjEkkAR2nnwo9H/e339a0oOH4v/Ooyl9
 Rrzk7znHQbHdlTn5c3gTGfuTX7WmPISQbWcH+BkWPoWtBU2zt8+hagAtDdQjATRUV3gVP4LBD4S
 w==
X-Received: by 2002:a05:6830:6682:b0:7dc:dd58:50a1 with SMTP id
 46e09a7af769-7e5fee5ef73mr8197143a34.15.1779673753669; 
 Sun, 24 May 2026 18:49:13 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:713b:3006:84c3:c1bb?
 ([2600:8803:e7e4:500:713b:3006:84c3:c1bb])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7e606459dadsm6267227a34.4.2026.05.24.18.49.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 May 2026 18:49:12 -0700 (PDT)
Message-ID: <3c12da03-6c62-4045-b831-e7b07c0ecb5d@baylibre.com>
Date: Sun, 24 May 2026 20:49:11 -0500
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
References: <20260525014654.2399354-1-dlechner@baylibre.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260525014654.2399354-1-dlechner@baylibre.com>
Cc: chrome-platform@lists.linux.dev, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] iio: pressure: cros_ec_baro: simplify
 timestamp channel definition
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
X-Spamd-Result: default: False [3.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[baylibre.com:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[baylibre.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[google.com,kernel.org,analog.com,microchip.com,bootlin.com,tuxon.dev,gmail.com,foss.st.com,chromium.org];
	FORGED_SENDER(0.00)[dlechner@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jbhayana@google.com,m:jic23@kernel.org,m:nuno.sa@analog.com,m:andy@kernel.org,m:nicolas.ferre@microchip.com,m:alexandre.belloni@bootlin.com,m:claudiu.beznea@tuxon.dev,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:bleung@chromium.org,m:groeck@chromium.org,m:chrome-platform@lists.linux.dev,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andriy.shevchenko@linux.intel.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[baylibre.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[dlechner@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.684];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 84D845C54AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/24/26 8:46 PM, David Lechner wrote:
> Use IIO_CHAN_SOFT_TIMESTAMP() to define the timestamp channel instead of
> manually filling in the struct iio_chan_spec fields. This makes the code
> less verbose and mistake-prone.
> 
FYI, there was a server error when doing b4 send, so this last patch
didn't get sent with the rest. I missed the [PATCH v2 9/9] when editing
it manually to send again.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
