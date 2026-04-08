Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Hz26B5rT1mkoJAgAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 09 Apr 2026 00:15:54 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD133C44FB
	for <lists+linux-stm32@lfdr.de>; Thu, 09 Apr 2026 00:15:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0438BC87EC5;
	Wed,  8 Apr 2026 22:15:53 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 39A87C36B12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Apr 2026 22:15:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E407E443B6;
 Wed,  8 Apr 2026 22:15:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AAD25C2BC9E;
 Wed,  8 Apr 2026 22:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1775686550;
 bh=qd97gSvYOsCinrKqjfSpyQyyC3+0l1mQqK8cxyagYwE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=R+DqiOCSf/aujk+/xbB+PZWiT9ZtmXyhrGmTI4F61VWOZGE7VZjJVXcjpydhKEd0D
 FSLTkselCkhjq7lzKIwFgqd5CiAJIu7gGpdo+1EVTI8BvvHp37HFMtEUXFWvgiUOp3
 VqG5dIqLdQt8/4PyiI7R32P2G9iaVEGBD53noNcQJQtvdtzskzHnijw4trNfOs4Dp1
 8Sc7swjiRZyguUUvPXSaJ2WOo+RQbJcyHVLsy0sWcEs27ZCuSYgGGZLgjiTFYo7GB1
 wsoETo9MCIw+PICPnfSHRKQ9n4gyTnS9jeDo96pGtqwFc/yQVHhXGmbBeIRWiRwl2N
 96BvZaXVUrdWA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 9761C10FC459;
 Wed,  8 Apr 2026 22:15:50 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 09 Apr 2026 00:15:44 +0200
MIME-Version: 1.0
Message-Id: <20260409-stmfts5-v4-1-64fe62027db5@ixit.cz>
References: <20260409-stmfts5-v4-0-64fe62027db5@ixit.cz>
In-Reply-To: <20260409-stmfts5-v4-0-64fe62027db5@ixit.cz>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1002; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=QDQEyb6yQN5WPWE8pVdtCQECptdn8p6xNSQzeqr7Q2U=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBp1tORTVIWUARSt+X8PEgpRWebBk61lkEJPfSUe
 Qn5hhASu4WJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCadbTkQAKCRBgAj/E00kg
 cpLTEACo06/04dYc2te03+Sy7fTTeUeGNPVohJ8IYXHmRlzwNqxLbH3zEffYQo4ogIp4AzNTrdQ
 PQMBbB9CZKT8OJSWPojgGhodpGdwTQLAxShW6fr0vY14adVsuUUie7qLGvopPQRm1tYaA+uqxe9
 mr2M+ylz9qrFPPrJaogMehFSipIUAdMFb5MnqDFWA0NjEqZp1uGbHC4T1F65w+49RlzaBu7z1AC
 zDrENGQ3dmQS8uNxV5xr08qCHSJq9U3PqSR3fc5jsrqTzxoLA48AGBGsbBEsFUrvpI6kCt/XXFO
 UdGalj2w2HB2KHwaYeneO4KFu/mD3Fe2Ylme65GClsUAjmxyoWfTPgOltIpUXgdBV1il1iS/+22
 ixalfRz2aHIDZv6t2lGFPM8eNxL/RgaRygUjSu4kvSIXJnodGhIXXs/VsIX0bVPccnbOSL2Afwh
 pzurDOVnmHN1gJitTqPEbmY17fl4llN1pEpYqDCB09ZjMdg99pYvhQqgxDxq+mc+NuGeGvOMt8n
 KjRzDRDXQy02HnXXjyKPdVEBnt1oWpHNdvS/dDaZXkoXHbbVLrTLtD7iQnuT2DulPtl/Sxp9+r1
 RXOiG/xINI+Hwj/2Azta5YpuTyxQOfNwpZyr6Lt5fLSnNJOkVVt5xvrzx/cs1tiCsYIXjRdvM8k
 wl7YY81E8PSVRWA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Petr Hodina <petr.hodina@protonmail.com>, David Heidelberg <david@ixit.cz>,
 linux-input@vger.kernel.org, phone-devel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 01/11] Input: stmfts - Fix the
	MODULE_LICENSE() string
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
Reply-To: david@ixit.cz
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Spamd-Result: default: False [4.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.torokhov@gmail.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rydberg@bitmath.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:petr.hodina@protonmail.com,m:david@ixit.cz,m:linux-input@vger.kernel.org,m:phone-devel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:dmitrytorokhov@gmail.com,m:mcoquelinstm32@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[david.ixit.cz];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,protonmail.com,ixit.cz,st-md-mailman.stormreply.com,lists.infradead.org];
	FREEMAIL_TO(0.00)[gmail.com,foss.st.com,kernel.org,bitmath.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.356];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:email,ixit.cz:email,ixit.cz:replyto,ixit.cz:mid]
X-Rspamd-Queue-Id: 9DD133C44FB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: David Heidelberg <david@ixit.cz>

Replace the bogus "GPL v2" with "GPL" as MODULE_LICNSE() string. The
value does not declare the module's exact license, but only lets the
module loader test whether the module is Free Software or not.

See commit bf7fbeeae6db ("module: Cure the MODULE_LICENSE "GPL" vs.
"GPL v2" bogosity") in the details of the issue. The fix is to use
"GPL" for all modules under any variant of the GPL.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/input/touchscreen/stmfts.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index 8af87d0b6eb64..def6bd0c8e059 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -807,4 +807,4 @@ module_i2c_driver(stmfts_driver);
 
 MODULE_AUTHOR("Andi Shyti <andi.shyti@samsung.com>");
 MODULE_DESCRIPTION("STMicroelectronics FTS Touch Screen");
-MODULE_LICENSE("GPL v2");
+MODULE_LICENSE("GPL");

-- 
2.53.0


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
