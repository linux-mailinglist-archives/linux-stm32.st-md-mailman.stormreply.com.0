Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2FF6B987C
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Mar 2023 16:04:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC451C65E60;
	Tue, 14 Mar 2023 15:04:51 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5DF3C64107
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Mar 2023 15:04:50 +0000 (UTC)
Received: from maxwell ([109.43.51.107]) by mrelayeu.kundenserver.de (mreue109
 [213.165.67.113]) with ESMTPSA (Nemesis) id 1MirfG-1q7s7C21hs-00exTj; Tue, 14
 Mar 2023 16:04:10 +0100
References: <20230314123759.132521-1-jh@henneberg-systemdesign.com>
 <20230314123759.132521-2-jh@henneberg-systemdesign.com>
 <ZBCIM//XkpFkiC4W@nimitz>
User-agent: mu4e 1.8.14; emacs 28.2
From: Jochen Henneberg <jh@henneberg-systemdesign.com>
To: Piotr Raczynski <piotr.raczynski@intel.com>
Date: Tue, 14 Mar 2023 16:01:11 +0100
In-reply-to: <ZBCIM//XkpFkiC4W@nimitz>
Message-ID: <878rfzgysa.fsf@henneberg-systemdesign.com>
MIME-Version: 1.0
X-Provags-ID: V03:K1:Wm2ytKUEV+DxoSZFFVeK86m/t8EpAeUoSfliuYPGpl5SQt5RAgh
 e6KCsq7PxzEqWsy306OUb+dE2q0GAaFc9xLI2m5LEhIblLUO2f/QluyChJmWIhx6JjhaJme
 GUu8JIC9wCOmB5jzZgEfufDvVI1Bw+m82bg0HRaos5yqQb6d5paSo+lCgmNO0IVdm6tOWVH
 26jGm1i/apkG0nctKwiLA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:NbTMfrKiRJU=;PKfWXhuZIT2Oe5LyhecyZpuYd8O
 gadBhi9lAMrFbjqC6m0y+TJ7eB18Fl7eF6jTpq75i+mte3L8NJjOJ+ii4LDfso6crmSVyFEc7
 UnBXTTREWWxhpfLXw2a8HVzKk7y+Z5O8SMDApZpOp1laWkRnxlXROIX2aPyjyO2m0cKPNt17x
 950D/TBDtENQBhRHlS5hOb/x5gkNfeOnVS5asEZzESBmtV98cmP9zcU85GP8J31CYaXDg8nBZ
 1Yb4WZE46t529pc+VDDFd7kJfWbVGWC5jS+eSXEY1slzmikelXqhgSjGIHz8nfRLpsCL/3bCE
 ypFx3HrcbX3MqY0tfgiNnymycxTpKVbxgopejbtq1KX4sWK79FY6ynri8HMSm4jpSvtJ9LR+b
 IVVeMOjzbte733kLpV4VqzfAPuSTcDjvmruRjeSXJ95j9PZxSSFdiBv9NyRf0jqy+U6WnmqR5
 JEiajaCeYuBvzK4Pr3RD2zkRQNXis+PWSVeSWJDH099OPYHXZ2Vv55ZfpQAS98+HiY76ynFDv
 OBNI6CKweeIRPg6kGic2Mo21kk44bTE27LQ9Gu9eCWMFp9hisiP3Cv+tP6lSaZvXX/EwRU2Pi
 zJ+Knykx4Z1Jdj1tnFDocv5sShpnWMDn5ogOlev6p2JhHI9mB+iKMqZran2qkAzI4VPsa70gy
 liLELTqIj7l+vWnY1TA/mRQZ6bK+SvR6KjYv33vfPw==
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 1/2] net: stmmac: Premature loop
 termination check was ignored
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


Piotr Raczynski <piotr.raczynski@intel.com> writes:

> On Tue, Mar 14, 2023 at 01:37:58PM +0100, Jochen Henneberg wrote:
>> The premature loop termination check makes sense only in case of the
>> jump to read_again where the count may have been updated. But
>> read_again did not include the check.
>
> Your commit titles and messages seems identical in both patches, someone
> may get confused, maybe you could change commit titles at least?
>
> Or since those are very related one liner fixes, maybe combine them into
> one?

I was told to split them into a series because the fixes apply to
different kernel versions.

>
> Also a question, since you in generally goto backwards here, is it guarded from
> an infinite loop (during some corner case scenario maybe)?

In theory I think this may happen, however, I would consider that to be
a different patch since it addresses a different issue.

>
> Other than that looks fine, thanks.
> Reviewed-by: Piotr Raczynski <piotr.raczynski@intel.com>
>
>> 
>> Fixes: ec222003bd94 ("net: stmmac: Prepare to add Split Header support")
>> Signed-off-by: Jochen Henneberg <jh@henneberg-systemdesign.com>
>> ---
>>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> index e4902a7bb61e..ea51c7c93101 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> @@ -5221,10 +5221,10 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
>>  			len = 0;
>>  		}
>>  
>> +read_again:
>>  		if (count >= limit)
>>  			break;
>>  
>> -read_again:
>>  		buf1_len = 0;
>>  		buf2_len = 0;
>>  		entry = next_entry;
>> -- 
>> 2.39.2
>> 


-- 
Henneberg - Systemdesign
Jochen Henneberg
Loehnfeld 26
21423 Winsen (Luhe)
--
Fon: +49 172 160 14 69
Url: https://www.henneberg-systemdesign.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
