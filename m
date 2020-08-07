Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B16E223EE62
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Aug 2020 15:43:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 765E8C36B3A;
	Fri,  7 Aug 2020 13:43:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EFC94C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Aug 2020 13:43:02 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 077Dax9v009897; Fri, 7 Aug 2020 15:42:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=STMicroelectronics;
 bh=yrH1sOj/tTHQBQooVD/Sbc7bjAl/F6ZnmtA5MxyZscw=;
 b=1TXy3bfK6Radyo6qP7mwfBoiv4mSCFlK9wAjuGFdzpWQwBC7TzyDgX1uwWiWLdkFb8Ua
 UZPhX/C7tQyoxVLuhUMj/d/trbpXar5qlSRnFG/u4OSOx7P9XI/ObcCPspOozBJ9ctRK
 ffvFkUQ9mgVLdAlU2dQQ7Ae7plM8B73omFpdHZC/FJ7DDKHTYQ0xnH9aZhqBXPBeecTJ
 qZoubeEuB67smJsqXzLTJDTNI/XJ6Gw/kWZwYHcRlwGVKp9jl/bbyI6Yzb3XHDs0wBo/
 nWTegWxkb11c/LPIw7l+3ov+MXKTTxyyf/qFEzNQH4YRhvhVU5DlzipmZWKjsMcG7ATE hA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32n6sbj1cw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Aug 2020 15:42:56 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7965310002A;
 Fri,  7 Aug 2020 15:42:56 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 662972B35EB;
 Fri,  7 Aug 2020 15:42:56 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.75.127.48) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 7 Aug
 2020 15:42:55 +0200
Date: Fri, 7 Aug 2020 15:42:54 +0200
From: Alain Volmat <alain.volmat@st.com>
To: Mark Brown <broonie@kernel.org>
Message-ID: <20200807134254.GC12946@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Mark Brown <broonie@kernel.org>, amelie.delaunay@st.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 fabrice.gasnier@st.com
References: <1596610933-32599-1-git-send-email-alain.volmat@st.com>
 <1596610933-32599-3-git-send-email-alain.volmat@st.com>
 <20200805104906.GB5556@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200805104906.GB5556@sirena.org.uk>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-07_09:2020-08-06,
 2020-08-07 signatures=0
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 02/18] spi: stm32-spi: defer probe for
	reset
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

On Wed, Aug 05, 2020 at 11:49:06AM +0100, Mark Brown wrote:
> On Wed, Aug 05, 2020 at 09:01:57AM +0200, Alain Volmat wrote:
> 
> > -	rst = devm_reset_control_get_exclusive(&pdev->dev, NULL);
> > -	if (!IS_ERR(rst)) {
> > +	rst = devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
> > +	if (rst) {
> > +		if (IS_ERR(rst)) {
> > +			ret = PTR_ERR(rst);
> > +			if (ret != -EPROBE_DEFER)
> > +				dev_err(&pdev->dev, "reset get failed: %d\n",
> > +					ret);
> > +			goto err_clk_disable;
> > +		}
> 
> This will not provide any diagnostics when deferring which isn't very
> helpful if there's issues.

Do you mean that a message when deferring would be needed ?

I am worrying that this would lead to having too much noise during boot
since probe deferring is kinda common. Of course it can also be due to a bad
configuration of the kernel as well but having looked around I think that
usually driver are rather silent in case of deferring.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
