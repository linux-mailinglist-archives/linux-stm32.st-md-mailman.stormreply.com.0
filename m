Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D59A24EBD40
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Mar 2022 11:09:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E8ABC60467;
	Wed, 30 Mar 2022 09:09:16 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A469C60464
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Mar 2022 09:09:14 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 n63-20020a1c2742000000b0038d0c31db6eso3026060wmn.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Mar 2022 02:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=pF/hvrI7qLDjIFK1PZiWN5svxVn5RrF/RKLGWeqqmq0=;
 b=YwlT6ooY5LZVCud47hjD3kjq5J2PtJRsbEtQHc6vflzUEeEpN8odscB+zjLMBN7stW
 hYn47ImQM/UY4YJ1Ru6twpC8LiFoOQ8LprNtUBavXaqVWHgOHFlbzCx756jylJNV3Yp9
 6/9t/A3XxA9qdzKF5+nCdP5aHR6tEF5+2GcZZVgmxJOEDmnwspBqLlcncg6zkL5ilwWr
 b8vlsb4NIVa9svDY8Wdm1gBQxnVAyl5MhAotSnIYqI7Rl+CvQLVQwExfQ3/PiXBnqQzn
 T//pXYch9DcznS2bDu+JjS2n2XbBY2N86LVJfZG6+M4SUbkHIk7q/1YDNmFmMZKmzNZj
 1oFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=pF/hvrI7qLDjIFK1PZiWN5svxVn5RrF/RKLGWeqqmq0=;
 b=UaDFzbXKljnwFcRS9pl7E5W3PFWhZ8NePaON99ogUfC2GV1K1gbMy0NlGNi2cNzCS5
 96FKf7OnaZ3TxqCBovyOTYDuqsYdBCtvMpm9B5RFjN7yzrgAodMpS9NYcezbD9QiPpr3
 XOuH83KcER8DUVy+f2ZTsRUdd+ebe3xqBAHNxHVtr7EeViBzO1o0n+QlxbzFPJmckIX/
 63/o4k3xedQhtYTfxVQBRw4uCCdulOj8v/SpNdh2M/BuNghSSXGc1wO7EwXYGmXKnZRj
 X4jfDmPCL5wv7Vj+9jZ5oGQIlcpGf5BNY4dXWf59KdOQkjXSGbsU6GZwHd7vJm/LnbDA
 h+Cw==
X-Gm-Message-State: AOAM531eJ03FrGX3gjSYdy0PXzMOEyMjAgXoGSLZDRltTM/0uKDSLu+z
 wZ2+sxfM+O0ZzgrqgFaNoRKHLg==
X-Google-Smtp-Source: ABdhPJziTOza5+DSVLs+SpPhhmrhW5VtbyiLFPjGbJGLbqWH/uguopC9MkTPv25t1gHAv/kwvQCSyg==
X-Received: by 2002:a7b:c778:0:b0:38c:9064:89fc with SMTP id
 x24-20020a7bc778000000b0038c906489fcmr3396059wmk.175.1648631353152; 
 Wed, 30 Mar 2022 02:09:13 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:e47f:3cdb:5811:cee8?
 ([2001:861:44c0:66c0:e47f:3cdb:5811:cee8])
 by smtp.gmail.com with ESMTPSA id
 n8-20020a5d5988000000b00203d5f1f3e4sm18249681wri.105.2022.03.30.02.09.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 02:09:12 -0700 (PDT)
Message-ID: <1b0bc704-a740-ea15-1e90-166905be27d0@baylibre.com>
Date: Wed, 30 Mar 2022 11:09:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20220329152926.50958-1-andriy.shevchenko@linux.intel.com>
 <20220329152926.50958-10-andriy.shevchenko@linux.intel.com>
 <94e888fe-d8fc-5379-302f-66d64f2ae10b@baylibre.com>
 <YkM22GwhxV+YKl8l@smile.fi.intel.com>
 <CAMuHMdWVA834tkeag=WOnHFGuhwZ93PkrgO24OV69Fye1hruLw@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <CAMuHMdWVA834tkeag=WOnHFGuhwZ93PkrgO24OV69Fye1hruLw@mail.gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Tomer Maimon <tmaimon77@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Benjamin Fair <benjaminfair@google.com>, Kevin Hilman <khilman@baylibre.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Nancy Yuen <yuenn@google.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Qianggui Song <qianggui.song@amlogic.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, openbmc@lists.ozlabs.org
Subject: Re: [Linux-stm32] [PATCH v2 09/13] pinctrl: meson: Rename REG_* to
	MREG_*
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 30/03/2022 10:54, Geert Uytterhoeven wrote:
> Hi Andy,
> 
> On Tue, Mar 29, 2022 at 6:47 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
>> On Tue, Mar 29, 2022 at 06:13:19PM +0200, Neil Armstrong wrote:
>>> On 29/03/2022 17:29, Andy Shevchenko wrote:
>>>> Rename REG_* to * as a prerequisite for enabling COMPILE_TEST.
>>>
>>> What error do you hit ?
>>
>> arch/x86/include/asm/arch_hweight.h:9:17: error: expected identifier before string constant
>> 9 | #define REG_OUT "a"
>>    |                 ^~~
> 
> Perhaps REG_{OUT,IN} in arch/x86/include/asm/arch_hweight.h should be
> renamed instead, as this is a generic header file that can be included
> anywhere, while the REG_{OUT,IN} definitions are only used locally,
> in the header file?

Even better, those REG_OUT/REG_IN should be undefined at the end of the header since only
used in the headers inline functions:
==============><==================================
diff --git a/arch/x86/include/asm/arch_hweight.h b/arch/x86/include/asm/arch_hweight.h
index ba88edd0d58b..139a4b0a2a14 100644
--- a/arch/x86/include/asm/arch_hweight.h
+++ b/arch/x86/include/asm/arch_hweight.h
@@ -52,4 +52,7 @@ static __always_inline unsigned long __arch_hweight64(__u64 w)
  }
  #endif /* CONFIG_X86_32 */

+#undef REG_IN
+#undef REG_OUT
+
  #endif
==============><==================================

Neil

> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
