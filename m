Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A6094E712
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Aug 2024 08:46:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F80BC7802C;
	Mon, 12 Aug 2024 06:46:41 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E6B01C7128F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 10 Aug 2024 20:22:45 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-42802e90140so529885e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 10 Aug 2024 13:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723321365; x=1723926165;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1WJSTsrRx4oJOBIrrFDvG+VDw/7Lzat/H74w3iZbcYY=;
 b=dOAUErztYg/JaH5e4I8wxqrte//0/sa+rpRaYLKrmKxTnqHI/yG4tDJ8+N2Rg4O4q+
 m6S8NC8xraThyHE2yizK5DT1qjY5zxgwM50UsV/CHlvPUZ3ztwD8De+hkW5WKRz1jp6/
 toLqVXSdzbcAV1N2MRhL3rIL2ZLTyDfTGrOMXVpZphtbpCKTtwWNkSos5+PoRKY6iW6O
 LjE0MSbZDFLBmXf8Vnub9/ma8jK+HjWA8JQy2Qfw6Q21dZCnMgc/vV9+eTTd2i0c5+y2
 +55mJdC8x83EUnbJ1W5fr2/8B+gcbei/vCGvbL2P8CZw3LYi0/qOAPaeRzPeHYbR51QH
 nqlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723321365; x=1723926165;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1WJSTsrRx4oJOBIrrFDvG+VDw/7Lzat/H74w3iZbcYY=;
 b=HVgE4c1oeH7DeZ4L4tZkJBmdFYVCLL4MjmpzWAU5ndebZn1cVycjPI7QcDfngaWBQ7
 XrovyeFC62DbNE5DKGerFqgKPaozEYRZ+xZ6qxq47v13/lswinVhGsJA/RerxG5SUZDB
 5QkODiQUnX8qLfpwSbjXV9EpfmwLudsRwDtyrad6DnBlB9HMKl1oZK7FTOKImq6OBUFi
 wgy+S+A2Qo5gyueH+m6pjN0gIXoUNVk0VTNt4MADZFbbwM+w/Q8lRFeJoaC87i4Kp99N
 OdK76JDR9HOboVywEONg0cNWimEKF3e3DC1yqhmg5sL50ZRuCjAKh0w9wPodR1ua6W2T
 f22w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUm9PPf+gUAz5KIvfUbv0KfvPfQQyfuxEdfWq/ez6031pIemdcmKOiZgC7xyL3HjblmyS1QUOoD3CmtfA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyqAELHPkfLznf6qGEYBRZUJvczTFeE23Nc7I/LrIeygzZE/G1n
 1G1IpI/X0xHgQW4hBDtPUuLtdhS9vq1un0FJbHvUawNr+LqtN2ek
X-Google-Smtp-Source: AGHT+IEFvhofB7r3PhdUBPxijlHgCD185WeOwLiwycpKBfUT6KYKDMx2W/FJx+S6yBZiVtGR8cfehQ==
X-Received: by 2002:a05:600c:3ca4:b0:426:6fc0:5910 with SMTP id
 5b1f17b1804b1-429c3a22819mr23707355e9.1.1723321364976; 
 Sat, 10 Aug 2024 13:22:44 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:d20e:7300:5ef1:c6e:2781:5ec2?
 ([2a01:4b00:d20e:7300:5ef1:c6e:2781:5ec2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36e4ebd33ffsm3198299f8f.99.2024.08.10.13.22.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Aug 2024 13:22:44 -0700 (PDT)
Message-ID: <13beb34b-3ff7-4b88-876f-0a7f65254970@gmail.com>
Date: Sat, 10 Aug 2024 21:22:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Amit Vadhavana <av2082000@gmail.com>, linux-doc@vger.kernel.org,
 ricardo@marliere.net
References: <20240810183238.34481-1-av2082000@gmail.com>
Content-Language: en-US
From: Ivan Orlov <ivan.orlov0322@gmail.com>
In-Reply-To: <20240810183238.34481-1-av2082000@gmail.com>
X-Mailman-Approved-At: Mon, 12 Aug 2024 06:46:41 +0000
Cc: catalin.marinas@arm.com, dave.hansen@linux.intel.com,
 conor.dooley@microchip.com, hpa@zytor.com, skhan@linuxfoundation.org,
 will@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel-mentees@lists.linux.dev, costa.shul@redhat.com, corbet@lwn.net,
 mpe@ellerman.id.au, x86@kernel.org, christophe.leroy@csgroup.eu,
 mingo@redhat.com, workflows@vger.kernel.org, aou@eecs.berkeley.edu,
 naveen@kernel.org, npiggin@gmail.com, bp@alien8.de, paul.walmsley@sifive.com,
 bhelgaas@google.com, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org,
 palmer@dabbelt.com, mcoquelin.stm32@gmail.com, dmaengine@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] Documentation: Fix spelling mistakes
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

On 8/10/24 19:32, Amit Vadhavana wrote:
> Corrected spelling mistakes in the documentation to improve readability.
> 

Hi Amit,

Since this patch contains changes for multiple files from different 
subsystems, it should be divided into file-specific changes (so you have 
one patch per updated file).

-- 
Kind regards,
Ivan Orlov
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
