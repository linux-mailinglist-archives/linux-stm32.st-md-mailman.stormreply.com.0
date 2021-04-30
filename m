Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 173EA36FED4
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Apr 2021 18:44:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B58FEC58D7A;
	Fri, 30 Apr 2021 16:44:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1A82C57B74
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Apr 2021 16:44:40 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13UGg75S027242; Fri, 30 Apr 2021 18:44:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=selector1; bh=leoHlgkF/ftolIMzLKhMrrl72r2iOxgjIvSScbSBRN8=;
 b=P2xA66nm+lyPghzA1IvbW3luuYOcb7CKSQjbDDx02reWWoY19bCbuSoXdxk3JK0C1SxF
 Blj+Enak4P5kvjGqg1T5+DhAjAd4Wh/jc+/KDf2JX8RDJgFX2mSQBmuPOwV8609z2eeu
 TBHX0pb+bM6cqT8gdtyKDU+g8KSnn8EQxIKg8eGKztmsHVbUNz/+xXYcmqg2FAd5purF
 6x8BJtSkr6WOFa8IWCq/Sjh+re3oR97iqQRbf25LI+rFIg6C2mmmTbtm3D4nYDY4B5b5
 J+B/LQBl2BZocKZ0FNSs0w7kN2wfiyVja4zgnEmUChoClE3CxM+AiN+W53w/FvaJ17SF kQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3881rpqb4m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 18:44:26 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 89B8910002A;
 Fri, 30 Apr 2021 18:44:25 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6AC1C2C4205;
 Fri, 30 Apr 2021 18:44:25 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.75.127.44) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 30 Apr
 2021 18:44:25 +0200
Date: Fri, 30 Apr 2021 18:44:13 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: <wsa@kernel.org>, <robh+dt@kernel.org>
Message-ID: <20210430164413.GA3426@gnbcxd0016.gnb.st.com>
Mail-Followup-To: wsa@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
 pierre-yves.mordret@foss.st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 fabrice.gasnier@foss.st.com
References: <1616998145-28278-1-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1616998145-28278-1-git-send-email-alain.volmat@foss.st.com>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-30_10:2021-04-30,
 2021-04-30 signatures=0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 0/2] i2c: stm32f7: add SMBus-Alert
	support
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

Gentle reminder about this serie about SMBus-Alert. Could you have
a look at it ?

Thanks
Alain

On Mon, Mar 29, 2021 at 08:09:03AM +0200, Alain Volmat wrote:
> This serie adds support for SMBus Alert on the STM32F7.
> A new binding st,smbus-alert is added in order to differenciate
> with the existing smbus binding.
> 
> SMBA alert control and status logic must be enabled along with
> SMBALERT# pin configured via pinctrl in the device tree. This is the
> rational for adding "st,smbus-alert" property.
> 
> ---
> v3:
> use lore.kernel.org links instead of marc.info
> 
> v2:
> When SMBUS alert isn't available on the board (SMBA unused), this
> logic musn't be enabled. Enabling it unconditionally wrongly lead to get
> SMBA interrupts.
> So, add "st,smbus-alert" dedicated binding to have a smbus alert with a
> consistent pin configuration in DT.
> 
> Alain Volmat (2):
>   dt-bindings: i2c: stm32f7: add st,smbus-alert binding for SMBus Alert
>   i2c: stm32f7: add SMBus-Alert support
> 
>  .../devicetree/bindings/i2c/st,stm32-i2c.yaml |  5 ++
>  drivers/i2c/busses/i2c-stm32f7.c              | 73 +++++++++++++++++++
>  2 files changed, 78 insertions(+)
> 
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
