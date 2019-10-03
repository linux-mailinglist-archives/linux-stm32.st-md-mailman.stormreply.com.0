Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E574BC9AFC
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Oct 2019 11:48:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9418BC36B0B;
	Thu,  3 Oct 2019 09:48:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 065B4C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Oct 2019 09:48:03 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x939fd1O020324; Thu, 3 Oct 2019 11:47:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=kN9FmgYjR/+h00iD+FWqgH8LfZypMJPodsHGme7Pa2U=;
 b=Ueu7492KlMOHrKSycPDSg2LPkrEWdivvPKLY1GOs4xx+yO3t8ExTim5uIUC07QvxoWKG
 3LT9SsL5b8qjCc49kEbhNfxAemN7lbkU0+pg4pUoFf7nWTFf+GoAnGIau3e1+Ge+26Vk
 hu4UlE5aBurWsPHyTrhGpmbjDgmaswU71tdJYWAUMXsgcSlCJdvbg08xf5gvNL/9qE3l
 BiJjf2O7egamZ3rj080Qm+BuaNoozraPZ1k/ujKLo+pSrybFr2C7QL1kTr+Byd91RW+Z
 VZJnqY6ObQ+ZbHo6SpStvCI9SaDMI4Da12gaEoovClMT/LnwsTUKRNBOBdn71RxBaG7Z fw== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com with ESMTP id 2v9w9w3u0a-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 03 Oct 2019 11:47:38 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 99F6953;
 Thu,  3 Oct 2019 09:47:32 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6CD812B492E;
 Thu,  3 Oct 2019 11:47:31 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.51) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 3 Oct
 2019 11:47:30 +0200
To: Olivier Moysan <olivier.moysan@st.com>
References: <1567440041-19220-1-git-send-email-olivier.moysan@st.com>
 <CAK8P3a3WvXmMys3mamCZef1-ychtdg+XbV=H-WTs2ZN6Jsrcbg@mail.gmail.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <c4c9ed0b-210a-43b0-fc7b-d45a24fe682f@st.com>
Date: Thu, 3 Oct 2019 11:47:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a3WvXmMys3mamCZef1-ychtdg+XbV=H-WTs2ZN6Jsrcbg@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-03_04:2019-10-01,2019-10-03 signatures=0
Cc: Arnd Bergmann <arnd@arndb.de>, Tony Lindgren <tony@atomide.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Yannick Fertre <yannick.fertre@st.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Olof Johansson <olof@lixom.net>, Simon Horman <horms+renesas@verge.net.au>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [Linux-stm32] [PATCH 0/4] ARM: multi_v7_defconfig: add audio
 support for stm32mp157a-dk1
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

Hi Olivier,

On 9/2/19 6:42 PM, Arnd Bergmann wrote:
> On Mon, Sep 2, 2019 at 6:01 PM Olivier Moysan <olivier.moysan@st.com> wrote:
>>
>> This patchset adds audio support for stm32mp157a-dk1 board.
>>
>> Olivier Moysan (4):
>>    ARM: multi_v7_defconfig: enable stm32 sai support
>>    ARM: multi_v7_defconfig: enable stm32 i2s support
>>    ARM: multi_v7_defconfig: enable cs42l51 codec support
>>    ARM: multi_v7_defconfig: enable audio graph card support
>  > The changes are ok, and I expect Alexandre will pick them up and forward
> to the soc tree.
>

Those changes have been applied on stm32-next (squashed in only one commit).

Thanks
Alex



> However, I would prefer these to just be a single patch, as there is little
> use in splitting the intended change up into one line per patch.
> 
>         Arnd
> 



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
