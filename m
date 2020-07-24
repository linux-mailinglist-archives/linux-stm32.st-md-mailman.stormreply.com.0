Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F7622C72D
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Jul 2020 15:59:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C1D4C36B27;
	Fri, 24 Jul 2020 13:59:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A2E7C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jul 2020 13:59:09 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06ODrl1D022365; Fri, 24 Jul 2020 15:58:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=KRUo6+0et9uIWzr/7OGkArIbrkrXoASlOdUHAzwrQ+c=;
 b=o4tYZ167aIAxYvG71/FxDIp91Y1Gl3UWSaaPkCo/tPveq6Rp1PD4p6uJo7eG/TRCpSrr
 4oz3oWk5Ge+YQ9BVEoqj+gbxiP+M25v2/4yKJk2n0vb1y52THqdiO2oX9r8Ie9RGZN1y
 w6pJ5JpPu5ini7M89305qeM9d8QaP6TLpYJdcPr8JwzJAKj491Nc+oM2J74+/cUGxhNj
 DCAaWGs3usAwNJXCW1mODvpK2DtZxKnNt8ZM2YhzF2yBbDyIQHTMcFaTdzID+A8kbUSZ
 LVz+Wm/JRsR8RD0wU/bQnzdQYlAvidy+qemtpIcFXMSSx5PQYfE17Lmk5QM6U717JD1u 4A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32bsfq0hx2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jul 2020 15:58:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3DBB110002A;
 Fri, 24 Jul 2020 15:58:57 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2557C2B4D1F;
 Fri, 24 Jul 2020 15:58:57 +0200 (CEST)
Received: from lmecxl0995.lme.st.com (10.75.127.49) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 24 Jul
 2020 15:58:56 +0200
To: Felipe Balbi <balbi@kernel.org>, Minas Harutyunyan <hminas@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre TORGUE <alexandre.torgue@st.com>
References: <20200724104711.5474-1-amelie.delaunay@st.com>
 <4c44f596-d2c3-6d2f-bf28-9e3964b6e6f1@st.com> <878sf9owcw.fsf@kernel.org>
From: Amelie DELAUNAY <amelie.delaunay@st.com>
Message-ID: <fcff5f96-8383-fd84-35f1-3eb291cd65df@st.com>
Date: Fri, 24 Jul 2020 15:58:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <878sf9owcw.fsf@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-24_04:2020-07-24,
 2020-07-24 signatures=0
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Fabrice GASNIER <fabrice.gasnier@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v3 0/3] Add USB role switch support to DWC2
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

On 7/24/20 3:50 PM, Felipe Balbi wrote:
> 
> (no top-posting, please)
> 
> Hi,
> 
> Amelie DELAUNAY <amelie.delaunay@st.com> writes:
>> Series dropped.
> 
> what do you mean with this? Should I drop all patches related with this series?
> 

As v1 patches were in your next branch, I've prepared a new patchset 
which contains fixes, on top of you next branch :
https://lore.kernel.org/patchwork/project/lkml/list/?series=454959


What do you prefer ? Drop all patches related to the v1 "Add USB role 
switch support to DWC2" series and I send a v4 in replacement or keep 
all patches and wait for new series review ?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
