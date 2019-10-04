Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 87052CB406
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Oct 2019 06:53:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 495C6C36B0B;
	Fri,  4 Oct 2019 04:53:02 +0000 (UTC)
Received: from mx6.ucr.edu (mx6.ucr.edu [138.23.62.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BCB9FC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Oct 2019 04:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
 t=1570164780; x=1601700780;
 h=mime-version:from:date:message-id:subject:to;
 bh=ql44aBwf8muduY7E8woRGM6sMLEeHBMPetACIWQG9tI=;
 b=XNUsbVb/8XJkxPcliEG0OXkJamNzW1ls4J6Ur5zGbY/lVPFm3KJ1cSij
 uGfRsABZnyw700DI0NZm7OeEyUpD8o4bg7jHtRVpIRlt9QT7A5ze0268S
 FgniGs6jXv6EUsgS8Hgn0s4ndmnaCSVoC6ZGDBiKv+ybh9EBWODlCLUpW
 O0POZ2QJx3hORpYqCNISD8DoVMctzqWqULDAPT9/8XkpAxGyo4msDlFYa
 nMoQITWveLltEKA5fXkAym7amFmdXn+C+Ji64cCqJK+Q+b3qLIV/vpg/3
 MiZy13SQtO89SQsHsQ75faQzRuC4CLl/R/6XNrL5CCsbzVSXd7JlXGTYE Q==;
IronPort-SDR: Rt3ms9OQc5pbgoIhRmpgvePy4Np9BghXerAAlgTOrCijXsWTAcYXQIB/peFhF8DpJyI7AlH2vf
 XcG9+Kcba0MjsNaETkbAppk05fLzyCMqjNRgnhV/bkfK14ByNsN/lCfU5WGCPmibe7/zPTH7ic
 zwWLaf8y3Q0meJHmlnnBuwnQIvO7oEtCwomhdpbfOoUdE/igc8uoxrFsANjm+mvblKLmqyOKws
 bwSAG6cbRcX3TlZVToDLYxQpghdwCIPkOFKNXD5nOhCi6tDUOczOiDGX8ByLcRei0GBxmbwpbL
 Ktk=
IronPort-PHdr: =?us-ascii?q?9a23=3Ap7oKphyuNwilhn3XCy+O+j09IxM/srCxBDY+r6?=
 =?us-ascii?q?Qd0usfKPad9pjvdHbS+e9qxAeQG9mCsLQZ06GM6OjJYi8p2d65qncMcZhBBV?=
 =?us-ascii?q?cuqP49uEgeOvODElDxN/XwbiY3T4xoXV5h+GynYwAOQJ6tL1LdrWev4jEMBx?=
 =?us-ascii?q?7xKRR6JvjvGo7Vks+7y/2+94fcbglVijexe7N/IAm5oQnPuMQdnJdvJLs2xh?=
 =?us-ascii?q?bVuHVDZv5YxXlvJVKdnhb84tm/8Zt++ClOuPwv6tBNX7zic6s3UbJXAjImM3?=
 =?us-ascii?q?so5MLwrhnMURGP5noHXWoIlBdDHhXI4wv7Xpf1tSv6q/Z91SyHNsD4Ubw4RT?=
 =?us-ascii?q?Kv5LpwRRT2lCkIKSI28GDPisxxkq1bpg6hpwdiyILQeY2ZKeZycr/Ycd4cWG?=
 =?us-ascii?q?FPXNteVzZZD4yzb4UBAekPM/tGoYbhvFYOsQeyCBOwCO/z1jNFhHn71rA63e?=
 =?us-ascii?q?Q7FgHG2RQtENAPsHXVrNX1KaASWv22w6nI1zrDbu5d1DD96YnJchAuu/CMUa?=
 =?us-ascii?q?5sfcff0kQvCh/Kjk+KpYP7IjyVy/0Avm6G5ORjTeKik3Arpx11rzS1xcohip?=
 =?us-ascii?q?PFipwJxl3H7yl13po5KcG+RUVme9CrCoFQuDufN4ZuR8MiRHxntzgix70dvJ?=
 =?us-ascii?q?67YDAKyJM6xx7Dc/CHc5aH4hbkVOuJJDd3nnNleLamixa280is1/TwVseq3F?=
 =?us-ascii?q?pWsiZJiNbMtncK1xzc7siIVOFx8Vum2TaKzwzT6+dELl4olafDNZIt3ro9mo?=
 =?us-ascii?q?AQvEnDBCP6hln6gayMekk65uSk9/zrYrD8qZ+dM490hBv+MqMrmsGnAeU5Mw?=
 =?us-ascii?q?gOUHKa+eigyLHu81b0QKhWgf0siKXWro3VJdkDqq6jHwBVypoj6wq4Dzq+1N?=
 =?us-ascii?q?QYnH8HLE9KeR6elIjpJ1TOLf7mAfqkmFSsjC5nx/XbMbH4B5XCNHnDkLPkfb?=
 =?us-ascii?q?ln7U5Q0hEzzcxY55JOD7EBOuz8Wlf1tN3YFBM2Lwu0w+O0QOl6g60XU3iOCa?=
 =?us-ascii?q?LRH6rJt16F/Kp7LeCGfo4etXDyIuMj5vP0pWQl31QaeP/tlacXaX2iBOUuGU?=
 =?us-ascii?q?iVYHzjyoMdEWYHpBAvCvbnhFyEXhZcYn+zW+Q34TRtTMqbEor0ZYSggbqMmQ?=
 =?us-ascii?q?QlGJxZLjRbTFOIHHbuesCHXPoKaS26OsJnnSEYT7+nSp9n2Rz48EffwqpmK+?=
 =?us-ascii?q?ec0SoBqJ/n1d49s+jYkggv+Dh1CYKGz2TWFUl7m2oJQ3k926Up5QRUzlqT2K?=
 =?us-ascii?q?50mfEQKdtJ6O5EGlMzMZPMxup2Ed20RgXbccqEYE26BN6hBGd1BtYwxcIeJl?=
 =?us-ascii?q?5iHv28gR3ZmSmnGbkYk/qMHpNwuqbd2WXhYt1hzi2c/LI9ylwqB85GNGmjj6?=
 =?us-ascii?q?g57BTUHYvTnl2dhuChcqFYlCrM8nqTiGOUuQRbXRR2XKHtWXEEelCQrNL3/E?=
 =?us-ascii?q?rOQraiT7M9PU8Jzc+EN7sPadDzi1hCbOnsNc6YYG+rnWq0QxGSyffEXorran?=
 =?us-ascii?q?gblBzcAU5MxxIT/GebMxEWDTznvmnESjFiCASrK2js/O9xuW7zdUgywEneZF?=
 =?us-ascii?q?Zm0bWd8QVTmPeGDf4fw+RXlj0mrmBFHUS9wtWeOdqJpkI1bbdcaNJluAxvyG?=
 =?us-ascii?q?nD8QFxI8rzfOhZmlcCflEv7AvV3BJtB9AFyJByoQ=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2HiAgDhz5ZdgMjQVdFlDhABBhKFRDO?=
 =?us-ascii?q?ETI5ehRcBmBgBCAEBAQ4vAQGEOwOCSiM4EwIDCQEBBQEBAQEBBQQBAQIQAQE?=
 =?us-ascii?q?JDQkIJ4VCgjopAYNVEXwPAiYCJBIBBQEiATSFCwWhWIEDPIsmgTKEDAGEWAE?=
 =?us-ascii?q?JDYFIEnoojA6CF4Nuc4dRglgEgTcBAQGVK5ZSAQYCghEUA4xRiEQbgiqXFo4?=
 =?us-ascii?q?rmUoPI4FGgXszGiV/BmeBT08QFIFbF41oBAFWJJF7AQE?=
X-IPAS-Result: =?us-ascii?q?A2HiAgDhz5ZdgMjQVdFlDhABBhKFRDOETI5ehRcBmBgBC?=
 =?us-ascii?q?AEBAQ4vAQGEOwOCSiM4EwIDCQEBBQEBAQEBBQQBAQIQAQEJDQkIJ4VCgjopA?=
 =?us-ascii?q?YNVEXwPAiYCJBIBBQEiATSFCwWhWIEDPIsmgTKEDAGEWAEJDYFIEnoojA6CF?=
 =?us-ascii?q?4Nuc4dRglgEgTcBAQGVK5ZSAQYCghEUA4xRiEQbgiqXFo4rmUoPI4FGgXszG?=
 =?us-ascii?q?iV/BmeBT08QFIFbF41oBAFWJJF7AQE?=
X-IronPort-AV: E=Sophos;i="5.67,254,1566889200"; d="scan'208";a="80145112"
Received: from mail-lj1-f200.google.com ([209.85.208.200])
 by smtpmx6.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Oct 2019 21:52:47 -0700
Received: by mail-lj1-f200.google.com with SMTP id y12so1386597ljc.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 03 Oct 2019 21:52:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=UonwauBUbF5jJCMbv+kEyggRBo1MYeaIpr/rVjEka4g=;
 b=kckLHjmJs7Q9AphQ6m8HTwsxs5JzAgsvHwPR0LwL2I3qwKb8l47TObj9WZJh/WjUS0
 3IQYmxjaTygnlBHdiaOKpwki3/Wplz1Fh6smquNDTh5TQhky8sg38Foy3wkuBGTtAiOB
 U3Cmua7y6bB7HYKUMUlRebLc9d/1d89wfs6njhBCDBAtt/aCNMFdH2DGZlrUl5D8cAMX
 s6DPp52++V3YBD4Rt2YGMZeqFROwy30thsi5SNBZYsPnQhyUpsRbrUVubFuThxGwLFpy
 TF1jJI/PE0bnnhd53yazoJXYDwdgyjlbThfiyRVjf6isjE1o+vDqN8vx3SZW2MII3zlJ
 aHNw==
X-Gm-Message-State: APjAAAVU4jTN+unW1Wrxsw4yu4fWizV0rw050qWqXvgCmmVnzE5s/Vtq
 XqlidjJ3rmtFVMqQ9GvPVny/NVFICtkPZbCqrwOoi7UW38qak6wBHGLtxa5QsVuoz8tTf7FVQSg
 F2/1LfYUuOohhzttrR3attBViDavTXvXwAliEGXDfZHMwfNkee6XSqKMLEA==
X-Received: by 2002:a19:4347:: with SMTP id m7mr7417791lfj.146.1570164764936; 
 Thu, 03 Oct 2019 21:52:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxQwQ4yv8ZIWgEbfBVR+NQnXGTuto6AhZqOSD61PfrwsPbsqTELSWEjRUHKiie8C8KsIwGEinKXPs2u+mEFOfQ=
X-Received: by 2002:a19:4347:: with SMTP id m7mr7417782lfj.146.1570164764695; 
 Thu, 03 Oct 2019 21:52:44 -0700 (PDT)
MIME-Version: 1.0
From: Yizhuo Zhai <yzhai003@ucr.edu>
Date: Thu, 3 Oct 2019 21:52:31 -0700
Message-ID: <CABvMjLSR9kFJpU19OX8Us4jPQ9vuTtNR571Njn_gqqpb-=hdCQ@mail.gmail.com>
To: Fabrice Gasnier <fabrice.gasnier@st.com>,
 Thierry Reding <thierry.reding@gmail.com>, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, 
 linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Zhiyun Qian <zhiyunq@cs.ucr.edu>, Chengyu Song <csong@cs.ucr.edu>
Subject: [Linux-stm32] Potential uninitialized variables in pwm: stm32-lp
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

Hi All:

drivers/pwm/pwm-stm32-lp.c:

Variable "val" and "prd" in function stm32_pwm_lp_get_state() could be
uninitialized
if regmap_read() returns -EINVAL. But it's directly used later without
the return check,
which is potentially unsafe.

Also, we cannot simply return -EINVAL in stm32_pwm_lp_get_state() because the
return type is void.

Thanks for your time to check this case.
-- 
Kind Regards,

Yizhuo Zhai

Computer Science, Graduate Student
University of California, Riverside
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
