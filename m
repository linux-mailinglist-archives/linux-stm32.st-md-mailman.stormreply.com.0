Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3D270B4DB
	for <lists+linux-stm32@lfdr.de>; Mon, 22 May 2023 08:07:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC0C3C6B458;
	Mon, 22 May 2023 06:07:25 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC0FCC6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 May 2023 11:46:58 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-2535edae73cso1707969a91.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 May 2023 04:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684496817; x=1687088817;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jSGGoVzH3JswzdDl5XE4PxxK2PV3ZgCuC8Lu9xCFt+I=;
 b=hG5hfdsttvTBHK/1SPB5ySPawmWk7IwRjf93Cbet3kH5Z/w+IcDTEOWBw/1oGK8Cpm
 +F9C/6fC9arjQy62Bk/M9dvXe5qhPLqj+DDlEf8XQ5Ym73dvErhgeX6NjbJCcvcctM/j
 YQIr0zh+ssZoGSeSLgUHDPonGzRc+j25MXUh+hh5LHgTzH/Jo70gEdx2/K2ub7jcufEZ
 IYyuz94mJBfnPTorzx+BZrAtO2hmyZzIuY35md5jgZyvQvYVIqW17Y9nolpesMbkJ5fp
 M4TNEVNiXb5B2a75L2UqWaVYuRZR6xI8nzoET02YHAlECrFb3lTk9Z1Sw6hZ2iYxj9/i
 QV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684496817; x=1687088817;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jSGGoVzH3JswzdDl5XE4PxxK2PV3ZgCuC8Lu9xCFt+I=;
 b=lPWF6DKpEK/VP7ffgcJ4+eBxf6jfMUXWInOgnI87z28yDqw5cs09iihkrd22S2YXnM
 pxSPdC3GIO750URH1bIgH60vDO/3mtmMGsZ+cWPZgMnhLcUs8alzJ4mQZmbybF1Xz9SF
 OLBKpiy8c0uTbi5UE2fqkViU7pM7JjHP6uRx55TUnucnKINy6q/woxtiHHXEsNMXCq4T
 SJtSpen6+le4cnhF8g+FnOCQeTQ7oTyQqs0IAF4Iz1C0NeWg8rx5rY5XoI9watdd6Cpw
 pA3hvZOmKlobpZgCZv7RygS5jBuIP/SMtk+1qu/xK9Mox5YdIKXlT+IgzjRLOJsploV4
 dQOQ==
X-Gm-Message-State: AC+VfDyMkHAOVnnfZk5/hUFdNeXci1QXXLhx/zIgTYqPbzjRh2nDgqne
 8lhHRiiPFGpSordeXfBm1mg=
X-Google-Smtp-Source: ACHHUZ5eTDIvMi0ryM3825Op83HjK9I5LxXQOyeBPd3sVk+yQdTZsUAg5zhYuHpz5dml/S1Xt1JOIA==
X-Received: by 2002:a17:902:da90:b0:1ad:d500:19ce with SMTP id
 j16-20020a170902da9000b001add50019cemr2006451plx.41.1684496817179; 
 Fri, 19 May 2023 04:46:57 -0700 (PDT)
Received: from ubuntu777.domain.name (36-228-97-28.dynamic-ip.hinet.net.
 [36.228.97.28]) by smtp.gmail.com with ESMTPSA id
 jb15-20020a170903258f00b001ae626d051bsm3268919plb.70.2023.05.19.04.46.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 04:46:56 -0700 (PDT)
From: Min-Hua Chen <minhuadotchen@gmail.com>
To: simon.horman@corigine.com
Date: Fri, 19 May 2023 19:46:52 +0800
Message-Id: <20230519114652.70372-1-minhuadotchen@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ZGdgA9jMLJOi1W1+@corigine.com>
References: <ZGdgA9jMLJOi1W1+@corigine.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 22 May 2023 06:07:23 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, edumazet@google.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 minhuadotchen@gmail.com
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: compare p->des0 and
	p->des1 with __le32
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

>On Fri, May 19, 2023 at 07:25:08PM +0800, Min-Hua Chen wrote:
>> Use cpu_to_le32 to convert the constants to __le32 type
>> before comparing them with p->des0 and p->des1 (they are __le32 type)
>> and to fix following sparse warnings:
>> 
>> drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c:110:23: sparse: warning: restricted __le32 degrades to integer
>> drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c:110:50: sparse: warning: restricted __le32 degrades to integer
>> 
>> Signed-off-by: Min-Hua Chen <minhuadotchen@gmail.com>
>
>Reviewed-by: Simon Horman <simon.horman@corigine.com>
>
>> ---
>>  drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
>> index 13c347ee8be9..eefbeea04964 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
>> @@ -107,7 +107,8 @@ static int dwxgmac2_rx_check_timestamp(void *desc)
>>  	ts_valid = !(rdes3 & XGMAC_RDES3_TSD) && (rdes3 & XGMAC_RDES3_TSA);
>>  
>>  	if (likely(desc_valid && ts_valid)) {
>> -		if ((p->des0 == 0xffffffff) && (p->des1 == 0xffffffff))
>> +		if ((p->des0 == cpu_to_le32(0xffffffff)) &&
>> +		    (p->des1 == cpu_to_le32(0xffffffff)))
>
>nit: Sorry for not noticing this in v1.
>     There are unnecessary parentheses (both before and after this change).
>
Thanks, I noticed this before submitting v2 (by checkpath.pl) but I keep
the original parentheses.

I will do v3 with your Reviewed-by tag. :-)

thanks,
Min-Hua
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
