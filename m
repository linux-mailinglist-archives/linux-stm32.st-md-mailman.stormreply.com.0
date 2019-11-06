Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 581ABF1F6C
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Nov 2019 21:00:58 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14845C36B0B;
	Wed,  6 Nov 2019 20:00:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61BB2C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Nov 2019 20:00:55 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xA6Jvkil015972; Wed, 6 Nov 2019 20:58:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=UUgh3Lo+qJDaOFvLiwrfPtl8yZf8yXbRZxfUc/25B9k=;
 b=hV6Qq7ATFv/8SsV9FqDv6wBDql0Y1AzlHZtF/pE7cBOUhEnHCNjNPQ7/rC1dW/nPwKUB
 a0OzrCjvqCSA4SOt4sy3nHKKVtvfPjHPVpZrqJLS4NlojDMcHuVIZ/FWXr/HRZTgrks/
 BlbLa6VY7mFYiredqke+l/zYKVBlHsdW09g1cQgTDiuxMx09Xgyyo+Vfj/qo30XzR5m2
 P14QcPUq5kQ2voYcxgPhN+sVMJyIG2rB6T+zIwFjszb1By9+GtEK4jXjKuXk3WdRqEJ/
 UpaKfnZbH5gT01tK+1VHarybQjZgLMwlpOcdGHGHEq4XqJposqZxXqr7c4J4X5zBYyqs Jg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2w41vdrs0f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Nov 2019 20:58:09 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3794C10002A;
 Wed,  6 Nov 2019 20:58:09 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag5node2.st.com [10.75.127.14])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1BA882BEC50;
 Wed,  6 Nov 2019 20:58:09 +0100 (CET)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG5NODE2.st.com
 (10.75.127.14) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 6 Nov
 2019 20:58:08 +0100
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Wed, 6 Nov 2019 20:58:08 +0100
From: Benjamin GAIGNARD <benjamin.gaignard@st.com>
To: Rob Herring <robh@kernel.org>
Thread-Topic: [PATCH 1/4] dt-bindings: counter: Convert stm32 counter bindings
 to json-schema
Thread-Index: AQHVj+cHKYpjTBsaoUanlMQvDBdoeKd9f6aAgAABnACAAQcxAA==
Date: Wed, 6 Nov 2019 19:58:08 +0000
Message-ID: <29d97cd1-4dc2-24a1-182f-d1bf6956ee5b@st.com>
References: <20191031123040.26316-1-benjamin.gaignard@st.com>
 <20191031123040.26316-2-benjamin.gaignard@st.com>
 <20191106041023.GB5294@bogus> <20191106041608.GA24747@bogus>
In-Reply-To: <20191106041608.GA24747@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-ID: <9AC39F460CE5B44394ED8C7013DF655A@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-06_07:2019-11-06,2019-11-06 signatures=0
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>, "knaack.h@gmx.de" <knaack.h@gmx.de>,
 Fabrice GASNIER <fabrice.gasnier@st.com>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "jic23@kernel.org" <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 1/4] dt-bindings: counter: Convert stm32
 counter bindings to json-schema
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


On 11/6/19 5:16 AM, Rob Herring wrote:
> On Tue, Nov 05, 2019 at 10:10:23PM -0600, Rob Herring wrote:
>> On Thu, Oct 31, 2019 at 01:30:37PM +0100, Benjamin Gaignard wrote:
>>> Convert the STM32 counter binding to DT schema format using json-schema
>> Probably this should all be 1 file instead.
> Also, checkpatch reports trailing whitespace in several of your patches.

I will write all in one file and fix trailing whitespace in v2

Thanks for your review

Benjamin

> .
>
> Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
