Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D272270B4D8
	for <lists+linux-stm32@lfdr.de>; Mon, 22 May 2023 08:07:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8560DC6B44B;
	Mon, 22 May 2023 06:07:25 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E3DEC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 May 2023 10:53:44 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-51b4ef5378bso2884529a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 May 2023 03:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684493623; x=1687085623;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ajFJ48fmtUSp4skMhzj/7YQeP1JQNLEyRY3cF/LDql8=;
 b=Aj+tL7aqW5ixdtpHbLQf7G4tDX5NUJluKjGQRqPFdhZuqa3QyNFbQvDYXjoNwpZb1I
 KlXbCivGUYQmPURgdszab3svGngD/Rs1Bhy2pi4HW+ShdhveFEykQPMzHHINQky6zmKV
 2E1tOraorigN3kg3+JH1PZ5Jg4ySO0ne+8hI6vjn353idS9QxAK5haWCLKK7ZQBDumri
 rPp68ernhiuF69NhPpospNvswNPtkUHi9vxQLItP395LnLHPudtik8L1hlAy+xD+jM0c
 RuPLqfTtN0voIvV9V9hWb/VSTqiC4HGMV1dp2MoRehpYa80wi/ZjS/nV/1AB/uuQUkhF
 aUNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684493623; x=1687085623;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ajFJ48fmtUSp4skMhzj/7YQeP1JQNLEyRY3cF/LDql8=;
 b=QO0KFJ0HBQhI/SXacbgcGr18PYAbNjAPrXUmWMNQAgOwTvRE+/KkPUHO1Dq+ZOflol
 R35DXrBolfyKM2f41gpeB4u3jQgvIm996t6tEZseh1/feejarC8UOxp5Pdrj/2rgOmz1
 94ui44Er6cy3cvWKwjukpko12qJ87d4hxeOHouxOPdaCAu4HVmuUv6ts36MwYhgHiJFd
 3Nix7nI8tOYkUJMf0TrZ0x0Bphnbnvr89nQMBqnlSFz/MrL3y3qUW8mXqHzZHhNPPUJF
 Andx8QyGW28NCFVQUWuW5sQa0PlSuCj+MSma+1+OB9+LQWeCgYIQdhPxcrqBEe8zAPU6
 HGZA==
X-Gm-Message-State: AC+VfDyVafWcVByNWQmvUoLzxPrtcTPp1Ii4yQ4zNME55o+Nt3HTKh/Y
 NmxhUiwuEiWy3h1fSkb+rdc=
X-Google-Smtp-Source: ACHHUZ5X9bAfTBvV8GBrU/XIXgqyTaBQiMONfy79cfEJcVUpPl1q/jXU/GQFSC/adSpDazqg05bD5g==
X-Received: by 2002:a17:902:eacc:b0:1aa:f78d:97b7 with SMTP id
 p12-20020a170902eacc00b001aaf78d97b7mr2296338pld.46.1684493622796; 
 Fri, 19 May 2023 03:53:42 -0700 (PDT)
Received: from ubuntu777.domain.name (36-228-97-28.dynamic-ip.hinet.net.
 [36.228.97.28]) by smtp.gmail.com with ESMTPSA id
 j6-20020a170902c08600b001ae365072cfsm3107840pld.219.2023.05.19.03.53.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 03:53:42 -0700 (PDT)
From: Min-Hua Chen <minhuadotchen@gmail.com>
To: simon.horman@corigine.com
Date: Fri, 19 May 2023 18:53:38 +0800
Message-Id: <20230519105338.4793-1-minhuadotchen@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ZGcs1sdy0RTrwNby@corigine.com>
References: <ZGcs1sdy0RTrwNby@corigine.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 22 May 2023 06:07:23 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, edumazet@google.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 minhuadotchen@gmail.com
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: use le32_to_cpu for p->des0
	and p->des1
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

Hi Simon,

>>  
>>  	if (likely(desc_valid && ts_valid)) {
>> -		if ((p->des0 == 0xffffffff) && (p->des1 == 0xffffffff))
>> +		if ((le32_to_cpu(p->des0) == 0xffffffff) &&
>> +		    (le32_to_cpu(p->des1) == 0xffffffff))
>
>Hi Min-Hua Chen,
>
>I'm not sure if it makes a meaningful difference in practice - and
>certainly it won't on LE systems. But I wonder if it's nicer to do the
>conversion on the constant rather than the variable part of the comparison.
>
>		if ((p->des0 == cpu_to_le32(0xffffffff)) &&
>		    (p->des1 == cpu_to_le32(0xffffffff)))

After reading your suggestion, I think:
the 'p->des0 == cpu_to_le32(0xffffffff)' gives the readers a hint that
p->des0 is __le32 type and I think it is easier (for me) to understand
than 'le32_to_cpu(p->des0) == 0xffffffff'

I will submit v2 for this, thanks for your comment.

thanks,
Min-Hua
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
