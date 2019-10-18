Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3FCDE4DB
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Oct 2019 08:54:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7DF32C36B0B;
	Mon, 21 Oct 2019 06:54:07 +0000 (UTC)
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D786C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Oct 2019 16:01:31 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id p30so3631087pgl.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Oct 2019 09:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gThyljWtDBKOhSiy6iEb52Z+/qQRS5Kp4hVB8LMGJq4=;
 b=A7/Tv/gOM+6HhintRWJJOEvZ/AdKsn7I2l/DAJ7OUeCkHrTr3E9HDo7LAZGy5a9vh7
 4WwtE1fCXfmc8BQ0axVIpFBHOC+31NPSn6fNdcXBuskW0pwH0z8qEHttIaNCsD9a/WT9
 CSWwteONKad90EyYOWLAZsMTcCSEs49m/y1SMk+tx74WXQrgJhCNZ3HfmXk/OtduEm5a
 qQ3itoPk54BDfX0j6mcM0EBih+R0ZJ3jfvuPOEs1X0w1p/oQbWS5sycEcXEEJZ0NVqCw
 KIW4YlYVRMoRzxXn6IQGQ6fKpjLslhSDGqrPTmsd2Npm9i4tTIfCLf1MpL79wCKrTDuf
 fISw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gThyljWtDBKOhSiy6iEb52Z+/qQRS5Kp4hVB8LMGJq4=;
 b=Np7Vj1moMgYgiJfmEgcAPN2nHykQ/fUEIBEoCqiZh+o7q9GDCpdpGrQHCAb1m2NJxE
 bgOkhlK/PXQqh7X+K6gfjhEMYsE1D9+TGY+eB4eZHu1yPw5ftP9w4/ET5yi6n+6DFzdG
 /KR931SJN9A91q+RbtNxLTiAxbYNOgus0V1hUlpgfWCj3fNtDBaYGfmUobkkGe3+i2B9
 mStwscEdUxxVNA1kgbPfyEtsWe40/bEj7wL+9IcaybNTDm4uJ90gQ1BBix0rlGYoJp43
 jaiDyvGQxaVpYIYsQmGA+YSl1VsdxRkFENLewnvLymhFBATDZxkhN4nWqr2Tc2szj2jx
 f/AQ==
X-Gm-Message-State: APjAAAXfAHyQ4RX/nPtLG57J7aFy2616VhkbjIbrTCPptG2MsNI1QVJz
 Dl/Fzc13qRg1RwmFpmmkWhU=
X-Google-Smtp-Source: APXvYqxdw4v17EuDhxFWcokH7nzzl0sqYrWyTpIrsUMe5Zs8hAQW6pbS2VQO0dMBPOdl7QCf5KPWZw==
X-Received: by 2002:a17:90a:e98d:: with SMTP id
 v13mr12063806pjy.64.1571414489913; 
 Fri, 18 Oct 2019 09:01:29 -0700 (PDT)
Received: from [192.168.86.235] (c-73-241-150-70.hsd1.ca.comcast.net.
 [73.241.150.70])
 by smtp.gmail.com with ESMTPSA id x12sm6458744pfm.130.2019.10.18.09.01.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Oct 2019 09:01:28 -0700 (PDT)
To: Shaokun Zhang <zhangshaokun@hisilicon.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <1571309950-43543-1-git-send-email-zhangshaokun@hisilicon.com>
From: Eric Dumazet <eric.dumazet@gmail.com>
Message-ID: <0b6b3394-f9f0-2804-0665-fe914ad2cdea@gmail.com>
Date: Fri, 18 Oct 2019 09:01:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1571309950-43543-1-git-send-email-zhangshaokun@hisilicon.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 21 Oct 2019 06:54:05 +0000
Cc: yuqi jin <jinyuqi@huawei.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: Fix the problem of tso_xmit
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



On 10/17/19 3:59 AM, Shaokun Zhang wrote:
> From: yuqi jin <jinyuqi@huawei.com>
> 
> When the address width of DMA is greater than 32, the packet header occupies
> a BD descriptor. The starting address of the data should be added to the
> header length.
> 
> Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Jose Abreu <joabreu@synopsys.com>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Signed-off-by: yuqi jin <jinyuqi@huawei.com>
> Signed-off-by: Shaokun Zhang <zhangshaokun@hisilicon.com>
> ---

Please add a Fixes: tag,
thanks.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
