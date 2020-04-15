Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7201B1A9C6C
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Apr 2020 13:35:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24F7FC36B0C;
	Wed, 15 Apr 2020 11:35:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 38DB6C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Apr 2020 11:35:33 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03FBW8SN016220; Wed, 15 Apr 2020 13:35:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=STMicroelectronics;
 bh=xwnv8U88f9gKci+4R9gluFy4x+fECpay1QPWcflQP9g=;
 b=1a6J3nynIHUs1ZBzTWuJaxYH4jNMp3BBhK17usGCKTozaL9ffKuxXU3NnHI3yV4ftL92
 mUQ3c0K60Y/1B5c5Aw+jOsV3cYnjNz2jekg253yeaXkRAquScKAT8NaCw/KJEnaJfBH8
 7Mhaon5u4CZ1iu7zjqwVUHVNVKonEp7bsvRsWwJdOo9HV5E4ioVxswrMG4/w3VaYeWJx
 mTUQbXbcrBLEVNBSXsVzmrj2asfCnrgh21Do4WePhZYLMkhH3arPyJsulQzX3JKur0wl
 AzjJIVogGD6M6WOBUGCHzyIXhFee9d5c/8D3qvZORE8OFsTb9ZMi6paQUpZvbnB/+FxL lg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30dn94bh6t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Apr 2020 13:35:24 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B759110002A;
 Wed, 15 Apr 2020 13:35:23 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A9F772B0FA8;
 Wed, 15 Apr 2020 13:35:23 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.75.127.48) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 15 Apr
 2020 13:35:23 +0200
Date: Wed, 15 Apr 2020 13:35:22 +0200
From: Alain Volmat <alain.volmat@st.com>
To: Wolfram Sang <wsa@the-dreams.de>
Message-ID: <20200415113522.GB16949@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
 pierre-yves.mordret@st.com, alexandre.torgue@st.com,
 linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 fabrice.gasnier@st.com
References: <1584642115-15378-1-git-send-email-alain.volmat@st.com>
 <20200415110101.GM1141@ninjato>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200415110101.GM1141@ninjato>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG5NODE2.st.com (10.75.127.14) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-15_03:2020-04-14,
 2020-04-15 signatures=0
Cc: linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com,
 linux-i2c@vger.kernel.org, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] i2c: i2c-stm32f7: improve nack debug
	message
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

On Wed, Apr 15, 2020 at 01:01:01PM +0200, Wolfram Sang wrote:
> On Thu, Mar 19, 2020 at 07:21:55PM +0100, Alain Volmat wrote:
> > From: Fabrice Gasnier <fabrice.gasnier@st.com>
> > 
> > Add information on slave addr in the nack debug message.
> > 
> > Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> > Signed-off-by: Alain Volmat <alain.volmat@st.com>
> 
> Applied to for-next, thanks! (I'd drop the __func__, though; doesn't
> add information, does it?)

In fact similar message is displayed in 2 places. One in case of master mode
isr and the other one in case of slave isr. This message is adding slave
address to the master mode isr. It only makes it more clear on first sight
but indeed displaying the slave address obviously means this is master mode.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
