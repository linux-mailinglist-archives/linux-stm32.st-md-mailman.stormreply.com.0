Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 133D3C8A01
	for <lists+linux-stm32@lfdr.de>; Wed,  2 Oct 2019 15:44:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C99F0C36B0B;
	Wed,  2 Oct 2019 13:44:16 +0000 (UTC)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C2F8C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Oct 2019 13:44:14 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x92Dhxsp055767;
 Wed, 2 Oct 2019 13:44:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=BaJ95um3KKSqNF7ksQIDUZ17nwsj4pbKXWWuet88V/4=;
 b=m7+YUN6Me/CDdeG4Fykh8l7bhBM07SQgUfoVn8ODAlI3+90o14CiGc7E2YjTcHhvQJsg
 EMAcdOEPtfameewP7QjmgW1g023ncU8mMZfQq6x7KdSqzh2L5vtVtYm48QHCUyfYcOOQ
 nogUAijf9MdDKZfohhi6xg36L66hwwwtkuykqjJKPaJgPgTLvEcGoMgIpEoE9Cv3unyQ
 zNxjiN4hq8v/zdI9uJUKy8+zw3fnIgA8hXDlBU26Y3Its8UCHL+ecf1c4jeaEOmcxleE
 qmQz0qFgpH/1wGz0+te7GcfJDno4GDCKj1ahqweigMuHMlRQ3ECrGgDvKVEGI67wl8Mx sg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2v9xxuw28t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 02 Oct 2019 13:44:07 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x92Dhtrv037305;
 Wed, 2 Oct 2019 13:44:06 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 2vbsm3vjfe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 02 Oct 2019 13:44:06 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x92Dglas017501;
 Wed, 2 Oct 2019 13:42:47 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 02 Oct 2019 06:42:46 -0700
Date: Wed, 2 Oct 2019 16:42:38 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Colin King <colin.king@canonical.com>
Message-ID: <20191002134238.GP29696@kadam>
References: <20191002110849.13405-1-colin.king@canonical.com>
 <20191002133356.GP22609@kadam>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191002133356.GP22609@kadam>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9397
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910020132
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9397
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910020132
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: xgmac: add missing
 parentheses to fix precendence error
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

On Wed, Oct 02, 2019 at 04:33:57PM +0300, Dan Carpenter wrote:
> On Wed, Oct 02, 2019 at 12:08:49PM +0100, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > The expression !(hw_cap & XGMAC_HWFEAT_RAVSEL) >> 10 is always zero, so
> > the masking operation is incorrect. Fix this by adding the missing
> > parentheses to correctly bind the negate operator on the entire expression.
> > 
> > Addresses-Coverity: ("Operands don't affect result")
> > Fixes: c2b69474d63b ("net: stmmac: xgmac: Correct RAVSEL field interpretation")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
> > index 965cbe3e6f51..2e814aa64a5c 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
> > @@ -369,7 +369,7 @@ static void dwxgmac2_get_hw_feature(void __iomem *ioaddr,
> >  	dma_cap->eee = (hw_cap & XGMAC_HWFEAT_EEESEL) >> 13;
> >  	dma_cap->atime_stamp = (hw_cap & XGMAC_HWFEAT_TSSEL) >> 12;
> >  	dma_cap->av = (hw_cap & XGMAC_HWFEAT_AVSEL) >> 11;
> > -	dma_cap->av &= !(hw_cap & XGMAC_HWFEAT_RAVSEL) >> 10;
> > +	dma_cap->av &= !((hw_cap & XGMAC_HWFEAT_RAVSEL) >> 10);
> 
> There is no point to the shift at all.

Sorry I meant to say it should be a bitwise NOT, right?  I was just
looking at some other dma_cap stuff that did this same thing...  I can't
find it now...

regards,
dan carpenter

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
