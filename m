Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0076D4535A0
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Nov 2021 16:21:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5D34C5E2CC;
	Tue, 16 Nov 2021 15:21:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B13EC5C829
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Nov 2021 15:21:03 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AGDcCsf017657;
 Tue, 16 Nov 2021 16:20:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=date : from : to :
 cc : subject : in-reply-to : message-id : references : mime-version :
 content-type; s=selector1;
 bh=QoQgYbIAYqqyndy0lpMG3AWVrk68VVjTmBAW9B7ADps=;
 b=Fc5c0QCnFHbqDnhYoeNR2fBkRjdgcJ8PhXDr+lPVffNKwrhbNStOGymy20c11kfkOMsn
 FJz65/diglwzHLsF4OPc+3P00RCuw7ewUV4/NO64rN2HRWTp1lw7up/TIh/I9iZw6Ukf
 3BhTEnHRzO/Iy0/0KOs1Yjb+n78uDbgnbz43D0I3DvDLtXDPI7zSA+v9aIhlOlvL/4PJ
 NfV3cUOmGyHoBsoO/jd12B5O19sBgcpkcIxOJJpQKhYKNsGC3182+ZD5Unwrww5KXGVG
 1KHULA/l6pAz+VEPcGue4z2Y8UyQVNKBnmh3F8yh8+21upvJWzL8iVWFkCMdDobmnn/0 5g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cc2u453x6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Nov 2021 16:20:41 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 62BE210002A;
 Tue, 16 Nov 2021 16:20:39 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1E2762350F0;
 Tue, 16 Nov 2021 16:20:39 +0100 (CET)
Received: from gnbcxd0088.gnb.st.com (10.75.127.46) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 16 Nov
 2021 16:20:38 +0100
Date: Tue, 16 Nov 2021 16:20:28 +0100
From: Nicolas Toromanoff <nicolas.toromanoff@foss.st.com>
X-X-Sender: toromano@gnbcxd0088.gnb.st.com
To: Nicolas Toromanoff <nicolas.toromanoff@foss.st.com>
In-Reply-To: <20211102164729.9957-8-nicolas.toromanoff@foss.st.com>
Message-ID: <alpine.DEB.2.21.2111161614500.27385@gnbcxd0088.gnb.st.com>
References: <20211102164729.9957-1-nicolas.toromanoff@foss.st.com>
 <20211102164729.9957-8-nicolas.toromanoff@foss.st.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-16_03,2021-11-16_01,2020-04-07_01
Cc: Marek Vasut <marex@denx.de>, Herbert Xu <herbert@gondor.apana.org.au>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "David S . Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 7/8] crypto: stm32/cryp - fix bugs and
 crash in tests
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


Hello,

> +static void stm32_cryp_write_ccm_first_header(struct stm32_cryp *cryp)
> +{
> [...]
> +	} else {
> +		/* Build the two first u32 of B1 */
> +		b8[0] = 0xFF;
> +		b8[1] = 0xFE;
> +		b8[2] = alen & 0xFF000000 >> 24;
> +		b8[3] = alen & 0x00FF0000 >> 16;
> +		b8[4] = alen & 0x0000FF00 >> 8;

Smatch found a bug here: "warn: shift has higher precedence than mask"

Regards,
Nicolas.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
