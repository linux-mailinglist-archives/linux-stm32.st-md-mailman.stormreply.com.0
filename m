Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 14671461505
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Nov 2021 13:26:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91D9EC5A4D4;
	Mon, 29 Nov 2021 12:26:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 73039C597B6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Nov 2021 12:26:31 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AT8UeAC024974;
 Mon, 29 Nov 2021 13:26:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=date : from : to :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=selector1; bh=G6PSSYkYmZM0MaQPoLImSJDApg8FN1Eq02Ab0suxV6U=;
 b=C+yRdUm4u05HRyZBVfUMGlaA8sdhNHX/m9bNNcKbUJWQRLMaY1xyV2Ne9x6y70g3ELhH
 f6UJ8bvsOJRr3hjW4DL97EbL/4nfQOWE2mP+VVC7VeOEcrLo3JOkxMl3H4Xz8v2qbqn/
 pkJpKnOAl0/mbDWQvO7tRV795uc32INN5GAsa4XdHULWIoJtEB1sRykajaCYgahQaMYE
 oF0g2nhpqnYL/GgWLiPaxgRCxXOv34wQ6DmBdd5U3r3pLQjmoVQT8yWujEYyXMqEkRq9
 BqP0SkUVbA5uhNDFsRpbgntc2zQNkkKjE0Oy6S3tLk2fJqZDF2EdnnjbGObQpk7LE3lL /A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cmudrsedc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 13:26:12 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1739810002A;
 Mon, 29 Nov 2021 13:26:11 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7AF88214D22;
 Mon, 29 Nov 2021 13:26:11 +0100 (CET)
Received: from gnbcxd0016.gnb.st.com (10.75.127.47) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 29 Nov
 2021 13:26:11 +0100
Date: Mon, 29 Nov 2021 13:25:45 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Wolfram Sang <wsa@kernel.org>, <pierre-yves.mordret@foss.st.com>,
 <alexandre.torgue@foss.st.com>, <linux-i2c@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <fabrice.gasnier@foss.st.com>, <amelie.delaunay@foss.st.com>
Message-ID: <20211129122545.GA486850@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 pierre-yves.mordret@foss.st.com, alexandre.torgue@foss.st.com,
 linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 fabrice.gasnier@foss.st.com, amelie.delaunay@foss.st.com
References: <1625062303-15327-1-git-send-email-alain.volmat@foss.st.com>
 <1625062303-15327-4-git-send-email-alain.volmat@foss.st.com>
 <YaTFsV0sIU6BA0ja@kunai>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YaTFsV0sIU6BA0ja@kunai>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-29_07,2021-11-28_01,2020-04-07_01
Subject: Re: [Linux-stm32] [PATCH 3/3] i2c: stm32f7: prevent calling slave
 handling if no slave running
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

On Mon, Nov 29, 2021 at 01:21:05PM +0100, Wolfram Sang wrote:
> On Wed, Jun 30, 2021 at 04:11:43PM +0200, Alain Volmat wrote:
> > Slave interrupt handler should only be called if there is actually
> > a slave registered and running to avoid accessing an invalid pointer.
> > 
> > Without this commit, an OOPS can be generated due to a NULL ptr dereference
> > while receiving an IT when there is no master transfer and no slave
> > running:
> >   - stm32f7_i2c_isr_event
> >   - no master_mode hence calling stm32f7_i2c_slave_isr_event
> >   - access to i2c_dev->slave_running leading to oops due to
> > slave_running being NULL.
> > 
> > Fixes: 60d609f30de2 ("i2c: i2c-stm32f7: Add slave support")
> > 
> > Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> 
> Is this one still of interest? You resent patches 1 and 2 but not this
> one?

No you can ignore it. Thanks.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
