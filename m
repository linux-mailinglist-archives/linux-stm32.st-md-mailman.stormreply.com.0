Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF2C4EC81F
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Mar 2022 17:23:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62598C60467;
	Wed, 30 Mar 2022 15:23:00 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7FB9CC01577
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Mar 2022 15:22:59 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id r13so29763042wrr.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Mar 2022 08:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=035VL1akDfA3rp4LH54Rc3G/U1HwVipvz0ZmdfyEOow=;
 b=HBNyPvECMaVw9sz7r7CfQ74AMIJrMRaExUtKfCpbiilPaQEkJtTikda78N1pZ4v9dd
 aCkPzzdpTnoqajJbTrX4nRyNznVVCQDFWx7A+F/oP399D1YgVe4Gn3+h4tYxGnt3NfyY
 MZbTAXyQT1I/jIWeXKdOvDqJiB9VW32bZGkm+gNe+Q/ubBEajExPVbFfV3JJuou0c+vw
 sYEGd/wBuN/RMkssawgqG9WbQ8yiw3oTt/r0JBFdyNSd/XQJPU4QiIHS/N4aI7wdW/3i
 Bf1gmZBSNBQGJyoHZIoy/RWTWrByfrgDPXQuEEZqtzRn7rd8oXXiAg0Zj+tPeWOUc1Sa
 Bj5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=035VL1akDfA3rp4LH54Rc3G/U1HwVipvz0ZmdfyEOow=;
 b=0MKp7KItMpOuV+4qTY7N6sYZ7Fg4Bfa9nCRJ1J+pac+y6C2TX9/Z/RsyGCGmhY+cCm
 WrJ/+njEL+n83lN61Q6TUcabFVTDHA/+HcKZKph4ZrYMr9Iu9mmOzdPxGdQ3a8BMG9Qh
 OjDArM8QROfkdN7gJKluLQbqQ3PCIIeFI66ZpK02EhGfqVv7TawCOR/8ZORX2o8lscSc
 GoB0PQITtsVtYeKiWjJ4L8qsr6cjM8nkUCYvESEbUW8sKd2PAtkGnwmbMKd3a6X7u5Gx
 /mJDzJusK2JnHAaYSdeExc1e5C+kpgTf23x8m14PTOsx7vXWMPhz0xO5cNV5+CZ6kpcD
 m90Q==
X-Gm-Message-State: AOAM5316NkNmCcTzeznvfFdvbdSri/+hDAzKlW2R5C3e0Xk6iTBTO8rQ
 YNqNWXF9zzjBUKD02NDyQ6nrHQ==
X-Google-Smtp-Source: ABdhPJwPO+9KqDC9OD9SVYuzhQrpd9w9wVAdCuyfdEX+Fx0MX21LDBTOjmjsuSvR25YetXYFuLlO1A==
X-Received: by 2002:adf:d1cf:0:b0:204:12b6:9f5 with SMTP id
 b15-20020adfd1cf000000b0020412b609f5mr96496wrd.249.1648653778974; 
 Wed, 30 Mar 2022 08:22:58 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:e47f:3cdb:5811:cee8?
 ([2001:861:44c0:66c0:e47f:3cdb:5811:cee8])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a05600c410700b0038c72ef3f15sm4801683wmi.38.2022.03.30.08.22.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 08:22:58 -0700 (PDT)
Message-ID: <6812bb31-5d2b-4737-c2ad-8727d105847d@baylibre.com>
Date: Wed, 30 Mar 2022 17:22:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20220329152926.50958-1-andriy.shevchenko@linux.intel.com>
 <20220329152926.50958-10-andriy.shevchenko@linux.intel.com>
 <94e888fe-d8fc-5379-302f-66d64f2ae10b@baylibre.com>
 <YkM22GwhxV+YKl8l@smile.fi.intel.com>
 <CAMuHMdWVA834tkeag=WOnHFGuhwZ93PkrgO24OV69Fye1hruLw@mail.gmail.com>
 <1b0bc704-a740-ea15-1e90-166905be27d0@baylibre.com>
 <YkQgfwUs8KbhF/b/@smile.fi.intel.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <YkQgfwUs8KbhF/b/@smile.fi.intel.com>
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
 Bartosz Golaszewski <brgl@bgdev.pl>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
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

On 30/03/2022 11:18, Andy Shevchenko wrote:
> On Wed, Mar 30, 2022 at 11:09:11AM +0200, Neil Armstrong wrote:
>> On 30/03/2022 10:54, Geert Uytterhoeven wrote:
>>> On Tue, Mar 29, 2022 at 6:47 PM Andy Shevchenko
>>> <andriy.shevchenko@linux.intel.com> wrote:
>>>> On Tue, Mar 29, 2022 at 06:13:19PM +0200, Neil Armstrong wrote:
>>>>> On 29/03/2022 17:29, Andy Shevchenko wrote:
> 
> ...
> 
>>>>> What error do you hit ?
>>>>
>>>> arch/x86/include/asm/arch_hweight.h:9:17: error: expected identifier before string constant
>>>> 9 | #define REG_OUT "a"
>>>>     |                 ^~~
>>>
>>> Perhaps REG_{OUT,IN} in arch/x86/include/asm/arch_hweight.h should be
>>> renamed instead, as this is a generic header file that can be included
>>> anywhere, while the REG_{OUT,IN} definitions are only used locally,
>>> in the header file?
>>
>> Even better, those REG_OUT/REG_IN should be undefined at the end of the header since only
>> used in the headers inline functions:
>> ==============><==================================
>> diff --git a/arch/x86/include/asm/arch_hweight.h b/arch/x86/include/asm/arch_hweight.h
>> index ba88edd0d58b..139a4b0a2a14 100644
>> --- a/arch/x86/include/asm/arch_hweight.h
>> +++ b/arch/x86/include/asm/arch_hweight.h
>> @@ -52,4 +52,7 @@ static __always_inline unsigned long __arch_hweight64(__u64 w)
>>   }
>>   #endif /* CONFIG_X86_32 */
>>
>> +#undef REG_IN
>> +#undef REG_OUT
>> +
>>   #endif
>> ==============><==================================
> 
> Can you submit a formal patch, please?

I'll submit it separately

> 
> 
> And I think it would be good to have my patch as well, so we do not depend on
> the fate of the other one.
> 

Yes sure

Thanks,
Neil
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
