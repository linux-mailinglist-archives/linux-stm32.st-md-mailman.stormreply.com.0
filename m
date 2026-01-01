Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5073FCF22C4
	for <lists+linux-stm32@lfdr.de>; Mon, 05 Jan 2026 08:16:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1DEE3C7BF60;
	Mon,  5 Jan 2026 07:16:30 +0000 (UTC)
Received: from mx4.wp.pl (mx4.wp.pl [212.77.101.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50BD3C8F279
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Jan 2026 15:25:27 +0000 (UTC)
Received: (wp-smtpd smtp.wp.pl 14939 invoked from network);
 1 Jan 2026 16:25:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
 t=1767281125; bh=7cu7M1If+mjSSs4ioK+w09azy9ovawcK5+/YpibqgM8=;
 h=From:To:Cc:Subject;
 b=LvLFAdZpWUUMzDA1zgdW/FuMCUj5cWqFvhVhdkXXnRl/Br308jaaXsJYTQ7B5SkFV
 47tdbVTJ6JeVs0M/OadAyrbgRssQAlIqs9oOvQNDPCmVlBQdFhGxFD2inRall3ljLT
 8epU2JFardX/h21XNYysMIB2Rrp/mJueNWtw+ekaiZDtd5hC/sYIMglegFIbYpaMMK
 fGydhGRq04BAQc+GvDR5Oa7p7IHkPITJKXr7vsYevtLkctdzWEWXjMBWoHF0irUu4f
 9zFmf1+WLMbDDye/hs7abx7uG75iwzXyAccHUvmdgdnyUaldW54E+4+riQgnf4iuHS
 Fb5g7gHvWLzPg==
Received: from 83.5.157.18.ipv4.supernova.orange.pl (HELO laptop-olek.lan)
 (olek2@wp.pl@[83.5.157.18]) (envelope-sender <olek2@wp.pl>)
 by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
 for <herbert@gondor.apana.org.au>; 1 Jan 2026 16:25:25 +0100
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: herbert@gondor.apana.org.au, davem@davemloft.net,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux-crypto@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu,  1 Jan 2026 16:25:18 +0100
Message-ID: <20260101152522.1147262-1-olek2@wp.pl>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-WP-DKIM-Status: good (id: wp.pl) 
X-WP-MailID: 52d700e05a9885415d344fe1ce7cddfa
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000007 [YbRR]                               
X-Mailman-Approved-At: Mon, 05 Jan 2026 07:16:21 +0000
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>
Subject: [Linux-stm32] [PATCH] crypto: testmgr - allow authenc(sha224,
	rfc3686) variant in fips mode
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

The remaining combinations of AES-CTR-RFC3686 and SHA* have already been
marked as allowed in 8888690ef5f7. This commit does the same for SHA224.

rfc3686(ctr(aes)) is already marked fips compliant,
so these should be fine.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 crypto/testmgr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index a302be53896d..5bae4871690f 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -4137,6 +4137,10 @@ static const struct alg_test_desc alg_test_descs[] = {
 		.suite = {
 			.aead = __VECS(hmac_sha224_des3_ede_cbc_tv_temp)
 		}
+	}, {
+		.alg = "authenc(hmac(sha224),rfc3686(ctr(aes)))",
+		.test = alg_test_null,
+		.fips_allowed = 1,
 	}, {
 		.alg = "authenc(hmac(sha256),cbc(aes))",
 		.generic_driver = "authenc(hmac-sha256-lib,cbc(aes-generic))",
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
