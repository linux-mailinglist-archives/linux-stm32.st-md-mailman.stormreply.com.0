Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0407282CBD
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Aug 2019 09:30:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E837C35E03;
	Tue,  6 Aug 2019 07:30:38 +0000 (UTC)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B1E13C35E01
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Aug 2019 17:39:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 74DB8C056807;
 Mon,  5 Aug 2019 17:39:06 +0000 (UTC)
Received: from rt4.app.eng.rdu2.redhat.com (rt4.app.eng.rdu2.redhat.com
 [10.10.161.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D7C3E5DA60;
 Mon,  5 Aug 2019 17:39:01 +0000 (UTC)
Received: from rt4.app.eng.rdu2.redhat.com (localhost [127.0.0.1])
 by rt4.app.eng.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id x75Hd0BJ023399;
 Mon, 5 Aug 2019 13:39:00 -0400
Received: (from apache@localhost)
 by rt4.app.eng.rdu2.redhat.com (8.14.4/8.14.4/Submit) id x75Hcnwa023396;
 Mon, 5 Aug 2019 13:38:49 -0400
From: Red Hat Product Security <secalert@redhat.com>
X-PGP-Public-Key: https://www.redhat.com/security/650d5882.txt
In-Reply-To: <CAJ7L_Gp2HJoFOVxTgakCJw3LMuiPY0+60-giOtw3OwRD6zyNTQ@mail.gmail.com>
References: <RT-Ticket-494100@engineering.redhat.com>
 <CAJ7L_Gp2HJoFOVxTgakCJw3LMuiPY0+60-giOtw3OwRD6zyNTQ@mail.gmail.com>
Message-ID: <rt-4.0.13-23214-1565026728-1358.494100-5-0@engineering.redhat.com>
Precedence: bulk
X-RT-Loop-Prevention: engineering.redhat.com
RT-Ticket: engineering.redhat.com #494100
Managed-BY: RT 4.0.13 (http://www.bestpractical.com/rt/)
RT-Originator: pjp@redhat.com
To: b.zolnierkie@samsung.com, bob.liu@oracle.com, chuck.lever@oracle.com,
 davem@davemloft.net, emamd001@umn.edu, gregkh@linuxfoundation.org,
 kubakici@wp.pl, kvalo@codeaurora.org, navid.emamdoost@gmail.com,
 sam@ravnborg.org
MIME-Version: 1.0
X-RT-Original-Encoding: utf-8
Date: Mon, 5 Aug 2019 13:38:48 -0400
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Mon, 05 Aug 2019 17:39:08 +0000 (UTC)
X-Mailman-Approved-At: Tue, 06 Aug 2019 07:30:37 +0000
Cc: kstewart@linuxfoundation.org, alexandre.belloni@bootlin.com,
 airlied@linux.ie, dri-devel@lists.freedesktop.org, bfields@fieldses.org,
 linux-ide@vger.kernel.org, thierry.reding@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, devel@driverdev.osuosl.org,
 joabreu@synopsys.com, linux-arm-kernel@lists.infradead.org,
 linux-serial@vger.kernel.org, jslaby@suse.com, matthias@redhat.com,
 smccaman@umn.edu, kjlu@umn.edu, josef@toxicpanda.com, johnfwhitmore@gmail.com,
 nbd@other.debian.org, linux-block@vger.kernel.org,
 linux-mediatek@lists.infradead.org, nishkadg.linux@gmail.com,
 matthias.bgg@gmail.com, peppe.cavallaro@st.com, tglx@linutronix.de,
 andriy.shevchenko@linux.intel.com, trond.myklebust@hammerspace.com,
 allison@lohutok.net, axboe@kernel.dk, mcoquelin.stm32@gmail.com,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 unglinuxdriver@microchip.com, vkoul@kernel.org, vishal@chelsio.com,
 daniel@ffwll.ch, colin.king@canonical.com, anna.schumaker@netapp.com
Subject: [Linux-stm32] [engineering.redhat.com #494100] Question on
	submitting patch for a security bug
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Reply-To: secalert@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hello Navid,

On Thu, 18 Jul 2019 01:30:20 GMT, emamd001@umn.edu wrote:
> I've found a null dereference bug in the Linux kernel source code. I was
> wondering should I cc the patch to you as well (along with the
> maintainers)?

No. Please do not cc <secalert@redhat.com> on the upstream kernel patches.
It is meant for reporting security issues only.

Going through the patches here

1. Issues in ../staging/ drivers are not considered for CVE, they are not to be
used
in production environment.

2. Many of the patches listed fix NULL pointer dereference when memory
allocation
fails and returns NULL.

3. Do you happen to have reproducers for these issues? Could an unprivileged
user trigger them?

> Also, I was wondering what are the steps to get CVE for the bug (this is
> the first time I am reporting a bug)?

Generally CVE is assigned after confirming that a given issue really is a
security issue. And it may
have impact ranging from information leakage, DoS to privilege escalation or
maybe arbitrary code
execution. Every NULL pointer dereference is not security issue.


Hope it helps. Thank you.
---
Prasad J Pandit / Red Hat Product Security Team

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
