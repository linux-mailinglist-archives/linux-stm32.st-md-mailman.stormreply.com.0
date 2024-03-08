Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B00B8875F9E
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Mar 2024 09:35:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62A0BC6C83D;
	Fri,  8 Mar 2024 08:35:41 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C1F5C6B46B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Mar 2024 08:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211; h=To:Cc:Date:Message-Id:Subject:Mime-Version:
 Content-Transfer-Encoding:Content-Type:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References;
 bh=EO0ldGpg9O+GJgqLq48vxSR6sHl0Gsnt3qgnSOjRNcw=; b=Dqj2kPWH+1uvSc3F08BZqW7Iwt
 eSSXbNkzmmFxNkDeLkZ0MX/88B1HHt5tQ5RNdWdn9FgNJ1piKAttxtCotKcI8SHXbt/Dj2wAlUvd7
 gzAlxP5Xkq28g/XsH/uSphzF/yM3GeUZujirRONm9Oj6q/s7pCTQV3P16f9SeKhalBkO7+vYYL6OY
 qS8BFuE4d9fxfPJmYSpy6t6TWKFRT7sxLALV9zc/n56NDl0J2ABZTFNIqWTQW20ZsqP3ddsOsolM6
 ytrc9s3zfn+5wCcVkt1XlXmcr1lwtBP5s0pgKnnhfBlMUjzQ7xZnCBsbaW/xnINF3CFs2uaDaUzfr
 Du4BJaSA==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <sean@geanix.com>)
 id 1riVhb-000Ion-1k; Fri, 08 Mar 2024 09:35:39 +0100
Received: from [2a06:4004:10df:0:a93a:6c75:8ef3:361d] (helo=smtpclient.apple)
 by sslproxy04.your-server.de with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92)
 (envelope-from <sean@geanix.com>)
 id 1riVha-000Htc-Iu; Fri, 08 Mar 2024 09:35:38 +0100
From: Sean Nyekjaer <sean@geanix.com>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Message-Id: <4A53A669-C3AF-4D29-B5A5-0F7FEBA79045@geanix.com>
Date: Fri, 8 Mar 2024 09:35:27 +0100
To: yannick.fertre@foss.st.com, raphael.gallais-pou@foss.st.com,
 philippe.cornu@foss.st.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com
X-Mailer: Apple Mail (2.3774.400.31)
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27207/Thu Mar  7 10:27:12 2024)
Cc: =?utf-8?Q?Martin_Hundeb=C3=B8ll?= <martin@geanix.com>
Subject: [Linux-stm32] STM32 DSI controller driver: mode_valid clock
	tolerance
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

SGksCgpJ4oCZbSB1c2luZyBhIHN0bTMybXAxNTcgd2l0aCBhIHNuNjVkc2k4MyBEU0kyTFZEUyBi
cmlkZ2UuClRoZSBMVkRTIGRpc3BsYXkgaXMgaGF2aW5nIGEgbWluaW11bSBjbG9jayBvZiAyNS4y
IE1IeiwgdHlwaWNhbCBvZiAyNywyIE1IeiBhbmQgYSBtYXggb2YgMzAsNSBNSHouCgpJIHdpbGwg
ZmFpbCB0aGUgbW9kZV92YWxpZCBjaGVjayB3aXRoIE1PREVfQ0xPQ0tfUkFOR0UuCkl0IHdpbGwg
cmVxdWVzdCAyNzIwMDAwMCBIeiwgYnV0IGlzIGdldHRpbmcgMjcyNTAwMDAuIEd1ZXNzIHRoZSBk
aXNwbGF5IGlzIGZpbmUgd2l0aCB0aGlzIDopCgpJbiB0aGlzIGNhc2UgaXQgc2VlbXMgYSBiaXQg
aGFyc2ggdG8gZmFpbCBpZiB0aGUgb3V0cHV0IGNsb2NrIGlzbuKAmXQgd2l0aGluIDUwIEh6IG9m
IHRoZSByZXF1ZXN0ZWQgY2xvY2suCgpJZiBIRE1JIGlzIHJlcXVpcmluZyBhIHRvbGVyYW5jZSBv
ZiA1MCBIeiwgd291bGQgaXQgYmUgYmV0dGVyIHRvIGRvIHRoZSBjaGVjayBpbiB0aGUgSERNSSBi
cmlkZ2UgZHJpdmVyPwoKL1NlYW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
