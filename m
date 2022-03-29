Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A4B4EAAFD
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Mar 2022 12:06:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0F68C5EC56;
	Tue, 29 Mar 2022 10:06:42 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 92E1EC5AB61
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Mar 2022 10:06:41 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 125-20020a1c0283000000b0038d043aac51so978619wmc.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Mar 2022 03:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=gJYdJOur1iY6XbbeGXFj0ECGEHoJkzCeSnRWw+1akAE=;
 b=g1SGsbd/jLtCfDq6yzASjQLg1D1Di4TRzjMb5UiIfrE9WiDmnp4ps8sIblZUNtYLhl
 BEYp/E3cwcQ3Zx0+p3QoptHL3A/ppqsLefEG80tXSSwr+mpdP4i1AcDwb/671KD/V7Or
 SrBc47ULMLUb19cniOzsSHJIDLc2hutPluz+X07qok/90+UjDzhv6DSHFkWqgCReRafg
 8hQGGxrcX5P2AlRlhAUeG7o275fLN5UY/luSiQ/PippZc5scePfD88DWfB5YY4mbajP2
 /wEv07hBPdodolgvcwPf/ryO4mcjf2pm6CqHleQKRp4LwbU9hZS+Lg1pg+jJITwfzWUK
 5rMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gJYdJOur1iY6XbbeGXFj0ECGEHoJkzCeSnRWw+1akAE=;
 b=XYSRzV7zeF/rCxPKcumdZS5g43JBh5ULHCpzHTrasyybxHgWsYFu95GATSy5OKnOiY
 OwivMkOqXXxwYtfkzlqx6o5ncjIY6IcXTzltKyaePRq+kZf3UBcZI6y0h/oXHYt3iZ2V
 HAR13R59euDrM3OvSjkIazVv05J1eivqb28Hn4TKA7Z9EcZzLMUE6PRl01M16pL9QhJE
 3xuxiEl24EDXtfrqDEpQZW+Hv5GJRnH5GwwjskgfW3dBFGwzY9a2ybCOuYZh/J+zpMQr
 qfUzXU2n03KlGkYSaeFyWX7atNfo5zxI0g92hLmsVEGglPNJPhyyICnpKnNJiy8fxRy3
 wn5w==
X-Gm-Message-State: AOAM531BduyydVuHATwFODYRgCcJJNARVkBR0Vsdh6WblP7Ptx/llJUJ
 bZpCs4ecLeMEXVr79DO9aKA=
X-Google-Smtp-Source: ABdhPJw/yl37bo84CH0/pwnTrqSkLHICdBHbZfyNAKleJ5pkLbBWcMtajlzC2TVgbnU7tHyn6wt30Q==
X-Received: by 2002:a05:600c:a47:b0:37c:965:2b6f with SMTP id
 c7-20020a05600c0a4700b0037c09652b6fmr5636166wmq.31.1648548400811; 
 Tue, 29 Mar 2022 03:06:40 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a5d456b000000b0020406ce0e06sm14201716wrc.94.2022.03.29.03.06.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Mar 2022 03:06:39 -0700 (PDT)
Message-ID: <6dafde7d-17c6-bd25-dbe8-7f7acf80fd91@gmail.com>
Date: Tue, 29 Mar 2022 12:06:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Tony Lindgren <tony@atomide.com>, Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <CAFr9PXkgrRe-=E=GhNnZ4w1x_FMb97-_RmX6ND1vEd74_TbZSw@mail.gmail.com>
 <YkK691VG6ON/6Ysn@atomide.com>
 <CAMuHMdXDDNTgBdJTa8+H1H5v1gAarp07xxWu_E1JL8mXS8HPMg@mail.gmail.com>
 <YkLXTWdZ3zASxr4H@atomide.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <YkLXTWdZ3zASxr4H@atomide.com>
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 openbmc@lists.ozlabs.org, Daniel Palmer <daniel@0x0f.com>,
 linux-arm-kernel@axis.com,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 linux-sunxi@lists.linux.dev, DTML <devicetree@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 linux-actions@lists.infradead.org, linux-unisoc@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "open list:TI ETHERNET SWITCH DRIVER \(CPSW\)" <linux-omap@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ansuel Smith <ansuelsmth@gmail.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, kernel@dh-electronics.com,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-oxnas@groups.io
Subject: Re: [Linux-stm32] [RFC PATCH 0/1] Categorize ARM dts directory
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



On 29/03/2022 11:54, Tony Lindgren wrote:
> * Geert Uytterhoeven <geert@linux-m68k.org> [220329 09:02]:
>> On Tue, Mar 29, 2022 at 10:03 AM Tony Lindgren <tony@atomide.com> wrote:
>>> For example, I have a pile of pending omap clock clean-up dts patches
>>> posted and tested waiting for v5.19-rc1 to apply. I'd rather not start
>>> redoing or fixing up the patches with sed :)
>>
>> Git merge/rebase/cherry-pick should handle renames fine?
> 
> Possibly.. Not sure I'd count on that based on my earlier experiences
> though :)
> 

Yes. If this could be split up in per silicon-vendor patches, the maintainer 
could take them. Although it might be a pain to soc maintainers to resolve small 
conflicts when merging that branches.

Just my 5 cents.

Matthias
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
