Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B90A2447BF8
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Nov 2021 09:35:58 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C254C5EC7F;
	Mon,  8 Nov 2021 08:35:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6E710C5A4FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Nov 2021 11:12:47 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A27KVoe027239;
 Tue, 2 Nov 2021 12:12:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=date : from : to :
 cc : subject : in-reply-to : message-id : references : mime-version :
 content-type; s=selector1;
 bh=3zDfwzbTTckNrmCbEG6nrtNSQ4GjS+cI8xuZ1RFHfsk=;
 b=mG1V3qX4rn4Qfinl6jU2a9fwfE8Zq+4pJtqkPBl/cvMOuRePHTS5sQ/BXNFahEWfy0EL
 OxZAfDs5yrSnyrNAAwBXYeFw2cUL5NXt7rc3Z9l0v3415K9m1p48Ig8LeHEbH7J916iB
 QFUdCmmRV+trXo60nVuMzgKhvvMDnB/+wy3kftY0+AyKjM+YOV1Xij/hrKrIjJ4acBJE
 lksOk/0EgpJHtqk1q6f1Ks8/eYyLEbMDYriYh/7dCgWXbQ4HfnP/ZKFQcyws/Er9vgcg
 OP1f/HrTK9yhgYRiVApaZxC1D/8Qm7GXQSsjMPq7d5DYd64ujPRAInc9MwvyMl4sU/CL 9w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3c30uvhf96-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Nov 2021 12:12:28 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 91F7210002A;
 Tue,  2 Nov 2021 12:12:26 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4C21B22BFC2;
 Tue,  2 Nov 2021 12:12:26 +0100 (CET)
Received: from gnbcxd0088.gnb.st.com (10.75.127.48) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 2 Nov
 2021 12:12:25 +0100
Date: Tue, 2 Nov 2021 12:12:20 +0100
From: Nicolas Toromanoff <nicolas.toromanoff@foss.st.com>
X-X-Sender: toromano@gnbcxd0088.gnb.st.com
To: Ard Biesheuvel <ardb@kernel.org>
In-Reply-To: <CAMj1kXF5_2AnQH8pjgzbeq63iSkdkUVq3wZM_NURotoHj0sJMw@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2111020907550.20378@gnbcxd0088.gnb.st.com>
References: <20211029135454.4383-1-nicolas.toromanoff@foss.st.com>
 <20211029135454.4383-4-nicolas.toromanoff@foss.st.com>
 <CAMj1kXF5_2AnQH8pjgzbeq63iSkdkUVq3wZM_NURotoHj0sJMw@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-02_07,2021-11-02_01,2020-04-07_01
X-Mailman-Approved-At: Mon, 08 Nov 2021 08:35:51 +0000
Cc: Marek Vasut <marex@denx.de>, Herbert Xu <herbert@gondor.apana.org.au>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 3/8] crypto: stm32/cryp - fix CTR counter
	carry
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



On Sun, 31 Oct 2021, Ard Biesheuvel wrote:

> On Fri, 29 Oct 2021 at 16:01, Nicolas Toromanoff
> <nicolas.toromanoff@foss.st.com> wrote:
>>
>> [...]
>>
>> @@ -1219,25 +1219,26 @@ static void stm32_cryp_check_ctr_counter(struct stm32_cryp *cryp)
>>
>>         if (unlikely(cryp->last_ctr[3] == 0xFFFFFFFF)) {
>>                 cryp->last_ctr[3] = 0;
>> -               cryp->last_ctr[2]++;
>> +               cryp->last_ctr[2] = cpu_to_be32(be32_to_cpu(cryp->last_ctr[2]) + 1);
>>                 if (!cryp->last_ctr[2]) {
>> -                       cryp->last_ctr[1]++;
>> +                       cryp->last_ctr[1] = cpu_to_be32(be32_to_cpu(cryp->last_ctr[1]) + 1);
>>                         if (!cryp->last_ctr[1])
>> -                               cryp->last_ctr[0]++;
>> +                               cryp->last_ctr[0] = cpu_to_be32(be32_to_cpu(cryp->last_ctr[0]) + 1);
>>                 }
>>
>
> crypto_inc() ??

Good point, I didn't know/find this function.

Thanks,
Nicolas.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
