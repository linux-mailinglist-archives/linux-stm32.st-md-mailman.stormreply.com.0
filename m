Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 249B12C6674
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Nov 2020 14:12:54 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8178C56631;
	Fri, 27 Nov 2020 13:12:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 47EE0C36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Nov 2020 13:12:52 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0ARCR5IV006586; Fri, 27 Nov 2020 14:12:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=GQp9+1KGBlt8NZocRR5PgA4+6R9ARvYpJUhtHSdjap4=;
 b=Es7xEDIEJ0QUnArrxgnbGB9ZxyUqE2gRrKoKk1LMIIwkaPTvfMJlIjf4olaABz+Oj9gS
 mOsI4nDjHhhh3Y2PfwK91qfIWAXBTUGNX/spvS96z3TGW6WQwD67OUhDPnDVQhp6nhyr
 UpmqGS3GPa2MeTGceActUCeO8JWwmraJUymkGDYRAZ5wGrQ5msgBDtvh0T02wwIu+Rs0
 TkcEysSPK7xn6x9YrnncOIuA20AA7RF5o5BtO/Ibgxc9N+73i6bUepBp8bSCfR8lfuRT
 NyEgeT81XIN/RUT+TK5glb3v/0RpY+dV+ULl+PPMt668MwgPlINY8Tf17NyLr5qp6Ijj Aw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34y0fhdnvn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Nov 2020 14:12:32 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5AC6510002A;
 Fri, 27 Nov 2020 14:12:32 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4234A24A63B;
 Fri, 27 Nov 2020 14:12:32 +0100 (CET)
Received: from lmecxl0995.lme.st.com (10.75.127.48) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 27 Nov
 2020 14:12:30 +0100
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20201106165805.31534-1-amelie.delaunay@st.com>
 <20201106165805.31534-4-amelie.delaunay@st.com>
 <e97a537a-9c7e-cd98-8ffa-93abae087128@st.com> <X8D6LgTHMpk2gph9@kroah.com>
From: Amelie DELAUNAY <amelie.delaunay@st.com>
Message-ID: <b9bd4d0f-a6e4-29f4-77aa-9d144edff18c@st.com>
Date: Fri, 27 Nov 2020 14:12:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <X8D6LgTHMpk2gph9@kroah.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-27_06:2020-11-26,
 2020-11-27 signatures=0
Cc: devicetree@vger.kernel.org,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-usb@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 Badhri Jagan Sridharan <badhri@google.com>, Rob Herring <robh+dt@kernel.org>,
 Jun Li <lijun.kernel@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 3/5] usb: typec: stusb160x: fix
 power-opmode property with typec-power-opmode
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



On 11/27/20 2:07 PM, Greg Kroah-Hartman wrote:
> On Fri, Nov 27, 2020 at 02:01:29PM +0100, Amelie DELAUNAY wrote:
>> Hi Greg,
>>
>> gentle reminder for this patch, lost in the middle of a DT series (DT part
>> already in stm32-next).
> 
> Odd, I don't see this anymore, can you resend just this one so I can
> apply it directly?

Sure :) I rebase it and send it right now.

Amelie
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
