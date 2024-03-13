Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D4D87BCB3
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Mar 2024 13:23:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B16BC6DD69;
	Thu, 14 Mar 2024 12:23:40 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31A9CC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Mar 2024 20:13:00 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id
 46e09a7af769-6e519d73850so132790a34.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Mar 2024 13:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710360779; x=1710965579;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mcoUVHgwLLkW5HjqhzTOaCJXpQUFZkJrmtPUv2eDI9M=;
 b=QNfX7yBBAW7HueIVHJ0gOWUF+6QcLm9K0Hb7Vnjv/ZT9wlko/kRrElofUSOrF2VMqE
 0QC/VEvevT7sEB6TBFKv8adZfKoc1J1plcoL5N0uILOOlrjeW+Uv36i1VJd9x9YgplGl
 XmzIe0RnbcRcWdgZsLcY62ffZ9c+4RFTGBo9vf78BlNyHkSqkS2PL7umSAw1cD8v2BEa
 fSrj7jf+4KU7P2+4YdRifnYXAoMr39UG5eiD3OXTlXSrmKU5nIXoY91Y8WQNv3aMTFBN
 3mKgloxtzweLF87yE/r//yLh9hiwRsinrDvK1yvtASD9hCS/qxrPpJkYQWuyIOGRGdeR
 E/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710360779; x=1710965579;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mcoUVHgwLLkW5HjqhzTOaCJXpQUFZkJrmtPUv2eDI9M=;
 b=FlOZB+JYEBS3cTANpXITz9danpTrQRRsLm8CnjjFxEBm421qwElNDJRFCpRmca3dbG
 LdgyWnFKS3cFrTULzbXtDkA1nEKBjaAmde+C3pf1KJK8ivqlhJyufSmJp9ueolTj++dF
 1dVJBrP+TZnMk7EmRtSbZ851ECg5gOlPNCIj6GHuikexWanuknGJHkmDugYo5Qw1iBK8
 6DyY5e+rMLapMJBdyyfxhGmiyU53/ML5vTVtYnkHTAcdCZ65Tqt/X7dY+yHwBmwD1cCu
 GFnQNiwq+h3EdFTC/BF52GqQd89r9z3NhjfjLLdCYH47K6nJ73F3J/c2eRV2rFZ08+HR
 eeEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5wXy2XUgPxwh8WLD0Bhtg0gA5MgLYP1H12O072pTvpKpSmbd5dt8SHv+xpH2IJQBD5q8Ss3H/T4YVkSdnPw4thNCoPnKq/BRvbGdRaQFjYcRfPEe0nyMQ
X-Gm-Message-State: AOJu0YwJeaToFmlN25gal5Rpoztnp9vrkpZm69HrIIw0RmIX35tiImXZ
 WV6widc1XgyeURsEjJDM2miiitv6JnfiGnLdpOBRh7wNch+/3Md8
X-Google-Smtp-Source: AGHT+IFSK8EKQA4YLa1BW2O3gR/c6PoFXPU5Py2EL9IBEyYIERWPhz76GtYioIywO8cwI62nqsu0ow==
X-Received: by 2002:a05:6870:f14e:b0:221:8fd9:284c with SMTP id
 l14-20020a056870f14e00b002218fd9284cmr4587256oac.1.1710360778906; 
 Wed, 13 Mar 2024 13:12:58 -0700 (PDT)
Received: from [10.102.4.159] ([208.195.13.130])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a0ce0c2000000b00690d36c64d2sm3341355qvk.53.2024.03.13.13.12.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Mar 2024 13:12:58 -0700 (PDT)
Message-ID: <b838e729-dc30-4e18-b928-c34c16b08606@gmail.com>
Date: Wed, 13 Mar 2024 13:12:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Eric Biggers <ebiggers@kernel.org>
References: <CZSHRUIJ4RKL.34T4EASV5DNJM@matfyz.cz>
 <005f998ec59e27633b1b99fdf929e40ccfd401c1.camel@sipsolutions.net>
 <f2dcbe55-0f0e-4173-8e21-f899c6fc802a@gmail.com>
 <20240313194423.GA1111@sol.localdomain>
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <20240313194423.GA1111@sol.localdomain>
X-Mailman-Approved-At: Thu, 14 Mar 2024 12:23:39 +0000
Cc: linux-wireless@vger.kernel.org, herbert@gondor.apana.org.au,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Karel Balej <balejk@matfyz.cz>, dhowells@redhat.com, mcgrof@kernel.org,
 keyrings@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, netdev@vger.kernel.org,
 linux-modules@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>,
 iwd@lists.linux.dev, davem@davemloft.net, dimitri.ledkov@canonical.com,
 linux-crypto@vger.kernel.org
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

On 3/13/24 12:44 PM, Eric Biggers wrote:
> On Wed, Mar 13, 2024 at 10:26:06AM -0700, James Prestwood wrote:
>> Hi,
>>
>> On 3/13/24 1:56 AM, Johannes Berg wrote:
>>> Not sure why you're CC'ing the world, but I guess adding a few more
>>> doesn't hurt ...
>>>
>>> On Wed, 2024-03-13 at 09:50 +0100, Karel Balej wrote:
>>>>    and I use iwd
>>> This is your problem, the wireless stack in the kernel doesn't use any
>>> kernel crypto code for 802.1X.
>> Yes, the wireless stack has zero bearing on the issue. I think that's what
>> you meant by "problem".
>>
>> IWD has used the kernel crypto API forever which was abruptly broken, that
>> is the problem.
>>
>> The original commit says it was to remove support for sha1 signed kernel
>> modules, but it did more than that and broke the keyctl API.
>>
> Which specific API is iwd using that is relevant here?
> I cloned https://kernel.googlesource.com/pub/scm/network/wireless/iwd
> and grepped for keyctl and AF_ALG, but there are no matches.

IWD uses ELL for its crypto, which uses the AF_ALG API:

https://git.kernel.org/pub/scm/libs/ell/ell.git/

I believe the failure is when calling:

KEYCTL_PKEY_QUERY enc="x962" hash="sha1"

 From logs Michael posted on the IWD list, the ELL API that fails is:

l_key_get_info (ell.git/ell/key.c:416)

Thanks,

James

>
> - Eric
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
