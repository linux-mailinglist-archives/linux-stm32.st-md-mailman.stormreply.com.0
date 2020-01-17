Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC6C14026F
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Jan 2020 04:39:33 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C863C36B0F;
	Fri, 17 Jan 2020 03:39:33 +0000 (UTC)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E354EC36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Jan 2020 03:39:30 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00H3bs2o063668;
 Fri, 17 Jan 2020 03:39:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=nuIy1AKUur+rkuPHpU5e8KcUcja25k7xLa+gNFNIWfo=;
 b=DQtxTb0fVig1P2lVno4+5cDrYQ5NeL1N9fMVqLBrJF4KxXMFl7JpfxnSgviQd51dCPM7
 RZXkPWUffhhYvJSpl2kcdRUG6TqFx0QBAQJnMYsAVko9EsttE6hLRCrGod92K114s+G7
 iuAU5MuynUpfa/7JK4G3vw/TWYBwF2x8PHGva1cTUVojM9zUQ9SKSxG1M3aZwl34tvcG
 jGbZl+GnIlJIQmoC1OdoeVDE2qeXuiRqZJyL2XB9oEWRd2rPrqpb36HZToIG832dTBNd
 5UN14I/BDnwSxJCo5v7LRI5Ar2Z3PHDKU1znWP80Tphd1jXEwKHtnCN/PiODfEay4Vit 5A== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 2xf73yxb0b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Jan 2020 03:39:04 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00H3cs5g027486;
 Fri, 17 Jan 2020 03:39:04 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 2xjxp4aaqu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Jan 2020 03:39:03 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 00H3cuob028532;
 Fri, 17 Jan 2020 03:39:00 GMT
Received: from kadam (/10.175.29.77) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 16 Jan 2020 19:38:56 -0800
Date: Fri, 17 Jan 2020 06:40:35 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Richard Weinberger <richard.weinberger@gmail.com>
Message-ID: <20200117034035.GB19765@kadam>
References: <20200113132346.rmeamdmbxwvo7kgj@kili.mountain>
 <CAFLxGvyBO=_4-f+HQPZSaAL=aJouok3y=MxEKjup3Q=Cj0KKZg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFLxGvyBO=_4-f+HQPZSaAL=aJouok3y=MxEKjup3Q=Cj0KKZg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9502
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001170026
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9502
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001170026
Cc: Richard Weinberger <richard@nod.at>, kernel-janitors@vger.kernel.org,
 linux-mtd@lists.infradead.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [Linux-stm32] [PATCH] ubi: Fix an error pointer dereference in
 error handling code
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

On Fri, Jan 17, 2020 at 12:50:14AM +0100, Richard Weinberger wrote:
> On Mon, Jan 13, 2020 at 2:24 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > If "seen_pebs = init_seen(ubi);" fails then "seen_pebs" is an error pointer
> > and we try to kfree() it which results in an Oops.
> >
> > This patch re-arranges the error handling so now it only frees things
> > which have been allocated successfully.
> >
> > Fixes: daef3dd1f0ae ("UBI: Fastmap: Add self check to detect absent PEBs")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >  drivers/mtd/ubi/fastmap.c | 19 +++++++++++--------
> >  1 file changed, 11 insertions(+), 8 deletions(-)
> > ---
> >  drivers/mtd/ubi/fastmap.c | 21 ++++++++++++---------
> >  1 file changed, 12 insertions(+), 9 deletions(-)
> 
> This patch seems badly formatted.
> Copy&paste error?
> 

Oh, yeah.  Sorrry.  I shouldn't affect anything though.  I can resend
if you want.

regards,
dan carpenter

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
