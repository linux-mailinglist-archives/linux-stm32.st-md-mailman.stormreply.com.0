Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 490B120F1A8
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Jun 2020 11:32:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E3360C36B11;
	Tue, 30 Jun 2020 09:32:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95EA8C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jun 2020 09:32:01 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05U9NmgO016151; Tue, 30 Jun 2020 11:31:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=STMicroelectronics;
 bh=l4SnfTz6ALle5A6so4k9LIpE7SfeF0TpncidqZF3610=;
 b=WZ5rpBhuwWnTUMeexGug1yaeaVGs1kH0hqSXe5XBBMkox46Z4995ah9SMQ88SSG0brca
 NWK0+XbSH1nilmX09QyCzmC6kVV2XuiFx8PW4zFfmM/X7VxX6tYgz3/F1Y2/X+zlhL6f
 jdfX4uQaBDH9cOQA3K3l9BFy829ugjVzqR1M2si7+QABimPAkPVAdSG6ZeF7f6e2mcH5
 cB/kUbd1DbCOa6NE73F+CaHkqZZKCV/ZFhl3ht4WyWSNtpx6YQSzIRVcOs0XMHY/GOGe
 dhhKcyOk1WohUPVY1r4BaICvmW0InO9KJvVwRRCjaO/EVRqxDxZFuD1cxbLEbAz0Jsmb xA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31wuk19r7s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jun 2020 11:31:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3CF31100034;
 Tue, 30 Jun 2020 11:31:37 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 00C992ADA04;
 Tue, 30 Jun 2020 11:31:36 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.75.127.44) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 30 Jun
 2020 11:31:36 +0200
Date: Tue, 30 Jun 2020 11:31:35 +0200
From: Alain Volmat <alain.volmat@st.com>
To: Wolfram Sang <wsa@kernel.org>
Message-ID: <20200630093135.GC5652@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 robh+dt@kernel.org, mark.rutland@arm.com,
 pierre-yves.mordret@st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 fabrice.gasnier@st.com
References: <1588657871-14747-1-git-send-email-alain.volmat@st.com>
 <1588657871-14747-5-git-send-email-alain.volmat@st.com>
 <20200523110140.GD3459@ninjato>
 <20200526103938.GC14423@gnbcxd0016.gnb.st.com>
 <20200630064050.GA996@ninjato>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200630064050.GA996@ninjato>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-06-30_03:2020-06-30,
 2020-06-29 signatures=0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com, robh+dt@kernel.org,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-i2c@vger.kernel.org,
 mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 4/4] i2c: stm32f7: Add SMBus-specific
	protocols support
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

Hi Wolfram,

> I meant a generic binding for the host-controller. It could be seen as a
> HW description if we need HostNotify on that bus or not.
> 
> Maybe it becomes more clear with the R-Car I2C controller as an example.
> It only supports one slave address. If I want HostNotify there, I can't
> use another slave backend. Now, it could be that I need the slave EEPROM
> backend, although there is a HostNotify capable device on the bus. So, I
> am leaning to have a generic "host-notify" binding for the host.
> 
> I consider platform_data legacy. If we use device_property, we should be
> safe regarding all current and future HW descriptions, or?

Ok, understood. Fine for me that way as well. I am just a little worrying that
the "host-notify" can now be present in both controller AND slave nodes
and might be a bit hard to understand. At the same time I don't have a better
proposal for naming the binding for the controller.

Please do not consider serie v2 I just posted few days ago and I will
post a serie v3 updating the binding information and using the host-notify
binding in the i2c-stm32f7 driver.

Alain
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
