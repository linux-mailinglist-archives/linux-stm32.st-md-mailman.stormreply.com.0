Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1F31100E2
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Dec 2019 16:10:17 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0EAA1C36B0B;
	Tue,  3 Dec 2019 15:10:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2FD82C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Dec 2019 15:10:15 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB3Ev0d7030223; Tue, 3 Dec 2019 16:07:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Ys0ox1ao18cOZfxiE9S2+ciC5jFVh+QzhShG4ijPhio=;
 b=WGNpS3znEhwLqh5hvH8FyLX+/jjMFKWWrzJEIUohw1R29GLiH6IZzb5aXa44rzZgSofx
 0BzsEIjy05zSZ5pXDQrnTLDVJ2qV+aQMdsJQHM0lTkfu0Mvv68gAFSimW/zNQ0dK5oWA
 sHWYmZc2ALRXTRitClj+9Kc0gCxJOCz6XwOdn5zZFEvgORb2XCJU0ZxE7BAUcfMlx++1
 a87Urph9exurYKC60oXEaJfxWMOaPI/+pnCxZixjaB81s+nGfRk9u9QT/rwBQmKVwtUq
 x0I5l4/mPuENDPRiWbO0MHfxXItgCrFN7KnBgwD426NoPYaCSKnHoqVfCnuxP0waVd8z gQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2wkf2xqw64-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Dec 2019 16:07:23 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9E95B10002A;
 Tue,  3 Dec 2019 16:07:20 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6D12D2BC7B6;
 Tue,  3 Dec 2019 16:07:20 +0100 (CET)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 3 Dec
 2019 16:07:20 +0100
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
 SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
 15.00.1347.000; Tue, 3 Dec 2019 16:07:19 +0100
From: Olivier MOYSAN <olivier.moysan@st.com>
To: Mark Brown <broonie@kernel.org>
Thread-Topic: [PATCH] ASoC: cs42l51: add dac mux widget in codec routes
Thread-Index: AQHVqedr55RsnCXb/EmaRp/MuIs00qeociSA
Date: Tue, 3 Dec 2019 15:07:19 +0000
Message-ID: <06c0474b-8b51-0ce6-b2aa-fc3b2c348f04@st.com>
References: <20191203141627.29471-1-olivier.moysan@st.com>
 <20191203143909.GL1998@sirena.org.uk>
In-Reply-To: <20191203143909.GL1998@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <5215F65C3009774EA7992774F10B1559@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-03_04:2019-12-02,2019-12-03 signatures=0
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "apatard@mandriva.com" <apatard@mandriva.com>,
 "perex@perex.cz" <perex@perex.cz>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] ASoC: cs42l51: add dac mux widget in
	codec routes
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

Hello Mark,

On 12/3/19 3:39 PM, Mark Brown wrote:
> On Tue, Dec 03, 2019 at 03:16:27PM +0100, Olivier Moysan wrote:
>
>> -	SND_SOC_DAPM_DAC_E("Left DAC", "Left HiFi Playback",
>> -		CS42L51_POWER_CTL1, 5, 1,
>> -		cs42l51_pdn_event, SND_SOC_DAPM_PRE_POST_PMD),
>> -	SND_SOC_DAPM_DAC_E("Right DAC", "Right HiFi Playback",
>> -		CS42L51_POWER_CTL1, 6, 1,
>> -		cs42l51_pdn_event, SND_SOC_DAPM_PRE_POST_PMD),
>> +	SND_SOC_DAPM_DAC_E("Left DAC", NULL, CS42L51_POWER_CTL1, 5, 1,
>> +			   cs42l51_pdn_event, SND_SOC_DAPM_PRE_POST_PMD),
>> +	SND_SOC_DAPM_DAC_E("Right DAC", NULL, CS42L51_POWER_CTL1, 6, 1,
>> +			   cs42l51_pdn_event, SND_SOC_DAPM_PRE_POST_PMD),
> This looks like an unrelated formatting change?
The reason of this change is to replace "HiFi Playback" by NULL, in 
order to connect
DAC widget to DAC mux widget, instead of connecting it directly to Playback.

Regards
Olivier
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
