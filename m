Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wM2CA4wjC2pJDwUAu9opvQ:T2
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2026 16:34:53 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0F756EE9F
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2026 16:34:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05CDCC5F1CF;
	Mon, 18 May 2026 14:34:53 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com
 [209.85.161.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E0979C5F1C5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 May 2026 14:34:51 +0000 (UTC)
Received: by mail-oo1-f51.google.com with SMTP id
 006d021491bc7-69d4371c2bbso132867eaf.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 May 2026 07:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre.com; s=google; t=1779114890; x=1779719690;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=R76EEUUYziDn4rTNwghYF5TGd9QqSpO9um+ZkcmBhtY=;
 b=OKZqBcBTd0ri9HpkO6AIQRgfl+Du/ZtrO1TJVCWIrKgDj5uvoF4UylC1uSTmNFxXvi
 wZQXDD4+SNOrjFoge5vwGCXuaKYVT6Ye2axIw9P8H/KAo0hzq9D541JujfGCZGGau9HO
 Y7VINRqb66k6kdSHmoTCFKH0jL6oAb1I9KbYp3VZqPHFobrQyEIlNhqSDyTafbewRbhc
 J0AAflCJqeIKb5kZWoavzVGEOYWN2l1fOR7DTiNKdVWiucIcFHUpR5854HhF+ey/QGWH
 4kFgEHEWkoEgS73Ei28/v99k4O5dsi5IQF8Yh4nRDG/ip2cpaHJ4h7eVLZHhwvpjocyN
 5akw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779114890; x=1779719690;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R76EEUUYziDn4rTNwghYF5TGd9QqSpO9um+ZkcmBhtY=;
 b=m8dBfE2ZRX10SNh6cfFALY+RpgO2Oajy9cmXtguvLQz9lpWcQ6vHgJ1OCNbaAVBV1C
 E3CGM1CISO7f4TH1zACCE9eCGbAZbTHGe/DvWei9JnshAU3w2KDC+NESlVU4LACPNUQl
 ATD9l4+nsr6bbw8bRlwDns8g1x0RTUM80WX26rnMdtI+U76bMPflgiaUSzvwZUM/LhRy
 FwWTSoBKegqIzZmeSAdtWFuPq2DWxhnFx3N9wEYIX9tw5TZxDCtiGsobHhM7GGw6iQmg
 7mtIzOR8ZVotwzBrv6sX1zXTEWknD0TMT408b1bnnbXrjQgHdMbS8Z6YYxgwtq9jTmFz
 8xzA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+EqlRjomOhmHJmeXRgr4eu5KhlW/aUQVnZQmpsB3nsZ1Bc52kqkONUH5LTsuj0kFuuVzZS1E6slpS+ww==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YytcN0BXfDnnNL0jMX/T3gG9eORO9ABKBDvHGZHLwv+g6MJYeAa
 f1nwNxFpM2TfmYZX1iFga+vnkZYPgurFxpZhAZKpUP+BhjDgMbwLb3jrOnOMLdsZc6c=
X-Gm-Gg: Acq92OHMYSPyfXRHJqAlagUjN6rfmzpI6hp4lf4cie0fjDzIUKKTZIsYo1jvGCDPozD
 L5MsNeqbjrbLcBYpB1A0Xp7cxYDNJqtpt8jhxuy+cYuSrIsLXPS7txTf0CZ2Gv8vAGaeSk9EzOg
 RBol4lZcL1vLNKNh2WDARU9lTn7JIWi5MSeBAKlxMZSU14BiXnjpzyOeI/Sf86QfqzCx7TZXM3G
 XK4KLZphQKksh3frb1JgO+hRrO7Q3ZgS/b8KAeGjR6GCmWi1wyMEc3oCsIpG1LDESTFkJP55ZE3
 wkMLhr7pkqq0DF86N31XfOk9ne6uXvWKwPDGkqIEkRTNxKKdbivyLhitMvqd2RVVdoqwGXhsKpQ
 xkOyqIbHeFKPLRDhqgIcGCBLvTovWzKoVgOdow4bvBcoXsYKk0ZX03oJGNFS3ABbPt1kr26i5PC
 MoE6BzJHFBpxHOIFrqRyQPePRyJEtw0IQK1QmxL3Mcr6QmTYKNuMe2bTw7CwjgPfjj/SGl7NGTi
 A==
X-Received: by 2002:a05:6820:1746:b0:688:2480:7fa8 with SMTP id
 006d021491bc7-69c942dac4dmr10442247eaf.21.1779114890563; 
 Mon, 18 May 2026 07:34:50 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:3be6:1187:fed4:378b?
 ([2600:8803:e7e4:500:3be6:1187:fed4:378b])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-69d049384f6sm5675126eaf.14.2026.05.18.07.34.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2026 07:34:50 -0700 (PDT)
Message-ID: <41c0317d-2ce8-412c-818a-4a84201fce29@baylibre.com>
Date: Mon, 18 May 2026 09:34:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andy Shevchenko <andriy.shevchenko@intel.com>
References: <20260517-iio-timestamp-cleanup-v1-0-61fb908c11c7@baylibre.com>
 <agq7PPw0qupI_8Dh@ashevche-desk.local> <agq8Q1wpzIw4XhNQ@ashevche-desk.local>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <agq8Q1wpzIw4XhNQ@ashevche-desk.local>
Cc: Andy Shevchenko <andy@kernel.org>, chrome-platform@lists.linux.dev,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jyoti Bhayana <jbhayana@google.com>, linux-kernel@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, linux-iio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Guenter Roeck <groeck@chromium.org>,
 Benson Leung <bleung@chromium.org>, linux-stm32@st-md-mailman.stormreply.com,
 Jonathan Cameron <jic23@kernel.org>
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
X-Spamd-Result: default: False [3.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[baylibre.com:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[baylibre.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[dlechner@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:andy@kernel.org,m:chrome-platform@lists.linux.dev,m:alexandre.belloni@bootlin.com,m:jbhayana@google.com,m:linux-kernel@vger.kernel.org,m:nicolas.ferre@microchip.com,m:nuno.sa@analog.com,m:linux-iio@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:mcoquelin.stm32@gmail.com,m:claudiu.beznea@tuxon.dev,m:groeck@chromium.org,m:bleung@chromium.org,m:linux-stm32@st-md-mailman.stormreply.com,m:jic23@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[baylibre.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[dlechner@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lists.linux.dev,bootlin.com,google.com,vger.kernel.org,microchip.com,analog.com,lists.infradead.org,gmail.com,tuxon.dev,chromium.org,st-md-mailman.stormreply.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,baylibre.com:mid,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 5F0F756EE9F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/18/26 2:14 AM, Andy Shevchenko wrote:
> On Mon, May 18, 2026 at 10:09:48AM +0300, Andy Shevchenko wrote:
>> On Sun, May 17, 2026 at 01:17:17PM -0500, David Lechner wrote:
>>> While looking around the code, I noticed that there are a lot of places
>>> were we are manually filling all of the fields of an IIO timestamp.
>>>
>>> This is error-prone (as seen in the first patch) and more verbose than
>>> it needs to be.
>>>
>>> I went with the approach of using the existing IIO_CHAN_SOFT_TIMESTAMP()
>>> macro for doing a struct assignment. This does require a cast, which
>>
>> No, it's *not* a cast. It's a compound literal. And instead of doing this in
>> every driver, add it to the macro (in a separate patch). Oh, let me just cook
>> it for you (I added that to several cases in the past).
> 
> 20260518071349.469748-1-andriy.shevchenko@linux.intel.com

Nice, thanks. I agree this will be the cleanest solution.

> 
>>> makes it a bit more verbose, but we were already doing that in to
>>> drivers, so I went with it anyway.
>>
>>> If we want to consider alternatives, we could make a iio helper function
>>> or macro like the first and second patches did.
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
