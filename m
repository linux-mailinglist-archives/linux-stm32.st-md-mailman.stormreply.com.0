Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 200D114E983
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Jan 2020 09:25:51 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D3F6AC36B0C;
	Fri, 31 Jan 2020 08:25:50 +0000 (UTC)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7EF91C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jan 2020 08:25:48 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00V8NIiR125627;
 Fri, 31 Jan 2020 08:25:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=9HJDg4ebV+36JCqgzBLlPd7SgnrdxJDhGJ/uJ+JFH5w=;
 b=g4IJM3qs4GwjlL9VCYQgNkQp2YhlDOd+SEZceV9za8UGvo9EhsNs5FvkHCaCFT+gea+l
 WA82aQYc5m5DZk/p7J9LBevmYm6HI+mF0sW4WMlnYCk7um1wisMTJpAPmlCNXi5Ve3F4
 EH3V3yG6Po9VVIyLg0NRjN+1Ih8zYFhD7EGqXlszWrLf3saKZ9cFpeMDHqn6OFoGWaaU
 2ma2AvsVhNaQJCS1FK5UGjZFzzCrjPH65HGS3pml7oucbHx+9YVVdhxr1gREHrHKo/Co
 lPDLF+YvKZdL+64fX9RNt9+dNhWbU9lqVjJEAalWqnEQL6p/oVcMwxw9P+wqxh8pnabm aw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 2xrearrppq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 31 Jan 2020 08:25:25 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00V8NFU0123097;
 Fri, 31 Jan 2020 08:25:24 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 2xva6q2yh0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 31 Jan 2020 08:25:24 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 00V8PLea003983;
 Fri, 31 Jan 2020 08:25:21 GMT
Received: from kadam (/129.205.23.165) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 31 Jan 2020 00:25:20 -0800
Date: Fri, 31 Jan 2020 11:24:51 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Message-ID: <20200131082451.GD11068@kadam>
References: <20200131045953.wbj66jkvijnmf5s2@kili.mountain>
 <CAHp75Vc7eudHy=05nHKB2==QJM1f23E1jZw=7yFKHA1nq0qBqA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHp75Vc7eudHy=05nHKB2==QJM1f23E1jZw=7yFKHA1nq0qBqA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9516
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001310074
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9516
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001310074
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Ajay Gupta <ajayg@nvidia.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 kernel-janitors@vger.kernel.org,
 Iyappan Subramanian <iyappan@os.amperecomputing.com>,
 Quan Nguyen <quan@os.amperecomputing.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Steve Glendinning <steve.glendinning@shawell.net>,
 Keyur Chudgar <keyur@os.amperecomputing.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, netdev <netdev@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net] device property: change
 device_get_phy_mode() to prevent signedess bugs
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

On Fri, Jan 31, 2020 at 10:15:14AM +0200, Andy Shevchenko wrote:
> On Fri, Jan 31, 2020 at 7:03 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > The device_get_phy_mode() was returning negative error codes on
> > failure and positive phy_interface_t values on success.  The problem is
> > that the phy_interface_t type is an enum which GCC treats as unsigned.
> > This lead to recurring signedness bugs where we check "if (phy_mode < 0)"
> > and "phy_mode" is unsigned.
> >
> > In the commit 0c65b2b90d13 ("net: of_get_phy_mode: Change API to solve
> > int/unit warnings") we updated of_get_phy_mode() take a pointer to
> > phy_mode and only return zero on success and negatives on failure.  This
> > patch does the same thing for device_get_phy_mode().  Plus it's just
> > nice for the API to be the same in both places.
> 
> 
> > +       err = device_get_phy_mode(dev, &config->phy_interface);
> 
> > +       if (err)
> > +               config->phy_interface = PHY_INTERFACE_MODE_NA;
> 
> Do you need these? It seems the default settings when error appears.
> 

We don't need it, but I thought it made things more readable.

regards,
dan carpenter

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
