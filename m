Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DDB87BCB1
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Mar 2024 13:23:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50F11C6B476;
	Thu, 14 Mar 2024 12:23:40 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9960C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Mar 2024 17:26:11 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id
 af79cd13be357-78850ab4075so4100385a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Mar 2024 10:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710350770; x=1710955570;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/xlPdDv6yvSDgUYLn/3ttkYWsR7atQ5kgTqz8H924Zg=;
 b=E0qec1M5LCcIa+jLOwEw2kfWE0oG04Pob7cQORnS7QPsPrvxvICrByDSNXD6hbhr6g
 zCTnOK3PXhEJdx1rOCmGT9F2Ome8X5o7P/uv3gTvqEaW73QA0wZs9UDhDTxg1B+BQILf
 jWmhdebYAmqzsdcho+Nq24cesx1Ti0GnYduF8wDl4t+SlZA5l1wiMuon+DiGwVaScKsx
 tIBaNke41/GW7ROxDlSyG/vuERuWoohXZlT9aanx2+gYDwl8+/0yRtOeKLTgaIFOxIsm
 QdNkgNauLpL+0S8fCJYznG7u8GjVf+gbtvK8E9OhCr3wNru/rM3VzQuEvDq1/AgP0rkU
 EWIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710350770; x=1710955570;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/xlPdDv6yvSDgUYLn/3ttkYWsR7atQ5kgTqz8H924Zg=;
 b=jFRJvNjpVLGzmKoeDekj7kESLMZN2Q8aGOGwB+h9BQ26MJIIPAmVmiFZoqzw4YrQ2w
 LM1RU2YWMA0hwiY5RCvO05aB88/ignwAQvtFKeu+bJdBc/thXvEOYKPpJmgblnDFOHZL
 FomTyOA1pmJpz9+W0W/EHonkX0YcoSaPi130qmJuFU0Gyr+1p2LvRxEIbUAgSflCHmz2
 EmCzXdSltj/RIsUZCV/aF9xRiBvRP07cF3qGr7FxL21wwzK5nVCo7D9DBY+waTavQHyO
 3QDk1VFk4WTLGeHGRFkULcTrseI2WjsLHdFsLyO6PqQI3Jbk72TiDrvrNPmWQT/HWNuy
 nFZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoNJT7BMmD9I8Y6+3rUTshXsfdRmZcYXO3dJlp+a7rWiZLONel7PMlqWFVmVyZhGy/n2ulQlrqacrcaSm53yMcmgYbRFpqdtMn/c/IyUmQg5dazv1pxjiB
X-Gm-Message-State: AOJu0Yz79lRbr0VlcFR8ZxdibrjsRAGbKvTVncM1A/sT/HSHnWECOaum
 FThrhN4DwSVmDRhCeYhHTpkABfDj2jI+j2cdtfh+/8Onl1r2bHTK
X-Google-Smtp-Source: AGHT+IFyyiGiWin6XQHjnKeLqB0dBkLVo4kmfRKf8luDrrfr/cY3NN2DX7JZ46wiVXxtXIKQSkqJLg==
X-Received: by 2002:a05:620a:178e:b0:787:a83a:cfed with SMTP id
 ay14-20020a05620a178e00b00787a83acfedmr607731qkb.70.1710350770507; 
 Wed, 13 Mar 2024 10:26:10 -0700 (PDT)
Received: from [10.102.4.159] ([208.195.13.130])
 by smtp.gmail.com with ESMTPSA id
 yf23-20020a05620a3bd700b007884b14b0b4sm4888800qkn.51.2024.03.13.10.26.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Mar 2024 10:26:10 -0700 (PDT)
Message-ID: <f2dcbe55-0f0e-4173-8e21-f899c6fc802a@gmail.com>
Date: Wed, 13 Mar 2024 10:26:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Johannes Berg <johannes@sipsolutions.net>, Karel Balej
 <balejk@matfyz.cz>, dimitri.ledkov@canonical.com
References: <CZSHRUIJ4RKL.34T4EASV5DNJM@matfyz.cz>
 <005f998ec59e27633b1b99fdf929e40ccfd401c1.camel@sipsolutions.net>
Content-Language: en-US
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <005f998ec59e27633b1b99fdf929e40ccfd401c1.camel@sipsolutions.net>
X-Mailman-Approved-At: Thu, 14 Mar 2024 12:23:39 +0000
Cc: herbert@gondor.apana.org.au, linux-wireless@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 dhowells@redhat.com, mcgrof@kernel.org, keyrings@vger.kernel.org,
 linux-crypto@vger.kernel.org, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, linux-modules@vger.kernel.org, iwd@lists.linux.dev,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [REGRESSION] Re: [PATCH] crypto: pkcs7: remove
	sha1 support
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

Hi,

On 3/13/24 1:56 AM, Johannes Berg wrote:
> Not sure why you're CC'ing the world, but I guess adding a few more
> doesn't hurt ...
>
> On Wed, 2024-03-13 at 09:50 +0100, Karel Balej wrote:
>>   and I use iwd
> This is your problem, the wireless stack in the kernel doesn't use any
> kernel crypto code for 802.1X.

Yes, the wireless stack has zero bearing on the issue. I think that's 
what you meant by "problem".

IWD has used the kernel crypto API forever which was abruptly broken, 
that is the problem.

The original commit says it was to remove support for sha1 signed kernel 
modules, but it did more than that and broke the keyctl API.

>
> I suppose iwd wants to use the kernel infrastructure but has no
> fallbacks to other implementations.
> johannes
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
