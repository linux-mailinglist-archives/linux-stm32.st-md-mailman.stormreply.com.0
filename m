Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F29288DBA
	for <lists+linux-stm32@lfdr.de>; Fri,  9 Oct 2020 18:06:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2CB9FC32EA8;
	Fri,  9 Oct 2020 16:06:33 +0000 (UTC)
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A12F5C32EA3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Oct 2020 16:06:31 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id md26so13813065ejb.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 09 Oct 2020 09:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mxO+I5LNxrcOwcYvX0IJyyJi/v9s48ckxPqo00HL+Xw=;
 b=XV+ZUq/hdjuq/ARetFqqjacQh/2BcONSA8rW35fw/sBgoXDcprcPgR6H8drf3Ey1Pb
 L+GksaUV5G7fhGeMBHTWbmOgZA5sI+gfr08BN2LCuIOvK0Vu1Gs/Z2AxWW+1OA9Pg0+h
 Q1ETKnshvjGqaUoBTGakzrxvMgWTxwYut+4KYvQlolNriey5VTfQAUwAX2Y6LAo309Js
 BN3WNNY5bYSedSO9dTY9IpWZJK3dAwBB/+dABgWpa0QDEG6owkzILh0unCZCRgjYn/lA
 RG2VnG/E+jnlD+FDd2JE30Ijeh3qIRRXHVnQuP2K4pfMfTmY89uzPfFo2k9/JRbMNtKU
 iZww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mxO+I5LNxrcOwcYvX0IJyyJi/v9s48ckxPqo00HL+Xw=;
 b=HqfkBTSxJBPy0IRFAVPHe8txJybFs92+Mv+efEPX5t6ZJCizw1ASGzaMnk4lmQhia6
 lL5EfIVHs9mCs/p3Y52Ak34Tfff4098gS0qj6kuS5x5IJr6b0/ZlHm5davxmQK7RIEJA
 ZdmkYbziY+4ce71iMfqXPEeh8jEf8Nen70B4HpbJW2d64aYuyrwLk9rhFo3BQUvPJSup
 Mg8ftI/MLx/lq/xBorWOZ0Cq7lI9hnYyOAdx1SQgPMTi6ECQUq4Ej8OEtSzlBvlkgSgo
 jndwgGXZsVE8JHHtyD3M4kOhNt4yo3IZEBMNyhw7VpV1Dp5OedxO+AG/e/mWVQONVQWv
 4VmQ==
X-Gm-Message-State: AOAM533bHhLYuK/Ecfigcfpdz/XdpTjyF7n1l8XI7JE2+jeeX58RoPdv
 /oSHTs0vYtvvf85P5gJ4/ZY=
X-Google-Smtp-Source: ABdhPJxnHXb6Br4QFjWPiyYOdwrFHi55f9ys4UhdL9yDCqWn2sQjviznQIoMH6qg+zFGiiJhaHuRNQ==
X-Received: by 2002:a17:906:f0d8:: with SMTP id
 dk24mr14840855ejb.492.1602259591162; 
 Fri, 09 Oct 2020 09:06:31 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f00:6a00:e538:757:aee0:c25f?
 (p200300ea8f006a00e5380757aee0c25f.dip0.t-ipconnect.de.
 [2003:ea:8f00:6a00:e538:757:aee0:c25f])
 by smtp.googlemail.com with ESMTPSA id v14sm867268edy.68.2020.10.09.09.06.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Oct 2020 09:06:30 -0700 (PDT)
To: Jakub Kicinski <kuba@kernel.org>
References: <20201008162749.860521-1-john@metanate.com>
 <8036d473-68bd-7ee7-e2e9-677ff4060bd3@gmail.com>
 <20201009085805.65f9877a@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <725ba7ca-0818-074b-c380-15abaa5d037b@gmail.com>
Date: Fri, 9 Oct 2020 18:06:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201009085805.65f9877a@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
Content-Language: en-US
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, John Keeping <john@metanate.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: Don't call _irqoff() with
	hardirqs enabled
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

On 09.10.2020 17:58, Jakub Kicinski wrote:
> On Fri, 9 Oct 2020 16:54:06 +0200 Heiner Kallweit wrote:
>> I'm thinking about a __napi_schedule version that disables hard irq's
>> conditionally, based on variable force_irqthreads, exported by the irq
>> subsystem. This would allow to behave correctly with threadirqs set,
>> whilst not loosing the _irqoff benefit with threadirqs unset.
>> Let me come up with a proposal.
> 
> I think you'd need to make napi_schedule_irqoff() behave like that,
> right?  Are there any uses of napi_schedule_irqoff() that are disabling
> irqs and not just running from an irq handler?
> 
Right, the best approach depends on the answer to the latter question.
I didn't check this yet, therefore I described the least intrusive approach.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
