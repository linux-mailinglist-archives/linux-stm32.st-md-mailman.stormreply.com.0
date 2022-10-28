Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6F5610E02
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Oct 2022 11:59:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 505E0C04003;
	Fri, 28 Oct 2022 09:59:00 +0000 (UTC)
Received: from ma1-aaemail-dr-lapp02.apple.com
 (ma1-aaemail-dr-lapp02.apple.com [17.171.2.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 17966C03FCB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Oct 2022 09:58:58 +0000 (UTC)
Received: from pps.filterd (ma1-aaemail-dr-lapp02.apple.com [127.0.0.1])
 by ma1-aaemail-dr-lapp02.apple.com (8.16.0.42/8.16.0.42) with SMTP id
 29S9u46C016057; Fri, 28 Oct 2022 02:58:06 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=apple.com;
 h=from : content-type :
 content-transfer-encoding : mime-version : subject : message-id : date :
 cc : to; s=20180706; bh=Xjc094u+AENYAy780wiOIS7Vu4csTEusafewG04ZfLk=;
 b=rGfIzaEiP9tADaTvuOLfYE2pgsuMC5cb+qiwBMdkZgjTDgVgxbNy1g0fN3wkyMpgYUTl
 /heKsKdnMoq6dT9A0qmUtPOtVJ09yi7YIRYeANjAbZGN0qf9i1VY+/QeE5iz/v0ZM3Q0
 6AmU3TrLKY7TBl+jHYBec1SCDnpcz2NxRrAxl9Uslo3SJkYJbjKepq7fJZVs/Ols4SgN
 pDHSCmF29wJUSkM5FqkmfOxmzM+GmZve/4fQBVQb0yCMrCaTAOklCeYKBYyQ6ICyZJal
 1PASLN/1vvZET+9GQgA1m5dnQizczpM1kwYrCssOAefGXXyJ/3a6+wOaSuekDa4DDDEL Ww== 
Received: from sg-mailsvcp-mta-lapp04.asia.apple.com
 (sg-mailsvcp-mta-lapp04.asia.apple.com [17.84.67.72])
 by ma1-aaemail-dr-lapp02.apple.com with ESMTP id 3kfareubhp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Fri, 28 Oct 2022 02:58:06 -0700
Received: from sg-mailsvcp-mmp-lapp03.asia.apple.com
 (sg-mailsvcp-mmp-lapp03.asia.apple.com [17.84.71.203])
 by sg-mailsvcp-mta-lapp04.asia.apple.com
 (Oracle Communications Messaging Server 8.1.0.19.20220711 64bit (built Jul 11
 2022))
 with ESMTPS id <0RKG00WGEJOSD500@sg-mailsvcp-mta-lapp04.asia.apple.com>; Fri,
 28 Oct 2022 17:58:04 +0800 (+08)
Received: from process_milters-daemon.sg-mailsvcp-mmp-lapp03.asia.apple.com by
 sg-mailsvcp-mmp-lapp03.asia.apple.com
 (Oracle Communications Messaging Server 8.1.0.19.20220711 64bit (built Jul 11
 2022)) id <0RKG00700J9FQ700@sg-mailsvcp-mmp-lapp03.asia.apple.com>; Fri,
 28 Oct 2022 17:58:04 +0800 (+08)
X-Va-A: 
X-Va-T-CD: f0a22bb548ee5a27b547ffb857e18dd9
X-Va-E-CD: c97f448c63d97b3cfb2d969c8ae164a2
X-Va-R-CD: 93ae6d4824a01f2bf1a497fa17aabd03
X-Va-CD: 0
X-Va-ID: c6ad71e9-3350-45ad-a0c1-eb8893672283
X-V-A: 
X-V-T-CD: f0a22bb548ee5a27b547ffb857e18dd9
X-V-E-CD: c97f448c63d97b3cfb2d969c8ae164a2
X-V-R-CD: 93ae6d4824a01f2bf1a497fa17aabd03
X-V-CD: 0
X-V-ID: 2a6940f2-5a7b-4957-803b-fa54b013e3a3
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.545, 18.0.895
 definitions=2022-10-28_04:2022-10-26,
 2022-10-28 signatures=0
Received: from smtpclient.apple (unknown [17.235.153.88])
 by sg-mailsvcp-mmp-lapp03.asia.apple.com
 (Oracle Communications Messaging Server 8.1.0.19.20220711 64bit (built Jul 11
 2022))
 with ESMTPSA id <0RKG00XG1JOO9F00@sg-mailsvcp-mmp-lapp03.asia.apple.com>; Fri,
 28 Oct 2022 17:58:03 +0800 (+08)
From: Vee Khee Wong <veekhee@apple.com>
MIME-version: 1.0 (Mac OS X Mail 16.0 \(3731.200.110.1.12\))
Message-id: <A23A7058-5598-46EB-8007-C401ADC33149@apple.com>
Date: Fri, 28 Oct 2022 17:57:49 +0800
To: michael.wei.hong.sit@intel.com
X-Mailer: Apple Mail (2.3731.200.110.1.12)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.545, 18.0.895
 definitions=2022-10-28_04:2022-10-26,
 2022-10-28 signatures=0
Cc: yoong.siang.song@intel.com, pabeni@redhat.com, yi.fang.gan@intel.com,
 weifeng.voon@intel.com, netdev@vger.kernel.org, tee.min.tan@intel.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 peppe.cavallaro@st.com, kuba@kernel.org, hong.aun.looi@intel.com,
 muhammad.husaini.zulkifli@intel.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/1] stmmac: intel: Separate
 ADL-N and RPL-P device ID from TGL
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

V2hhdCBpcyB0aGUgcHVycG9zZSBvZiB0aGlzIHBhdGNoPwoKVGhlIGZ1bmN0aW9uIGRlZmluaXRp
b24gbG9va3MgZXhhY3RseSB0aGUgc2FtZSBhcyDigJh0Z2xfc2dtaWlfcGh5MF9kYXRh4oCZLgoK
ClJlZ2FyZHMsClZlZSBLaGVlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
