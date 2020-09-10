Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCCE264EE9
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Sep 2020 21:29:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38819C424B7;
	Thu, 10 Sep 2020 19:29:30 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1FDDEC3FAE1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Sep 2020 19:29:27 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7CA4620882;
 Thu, 10 Sep 2020 19:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599766166;
 bh=hL6w8E8SUjjPiOKWWzA5Ali9T6LnigQnlGkrYfgRtaI=;
 h=From:To:Cc:Subject:Date:From;
 b=x84wJj85EWTbHdmxLHCcca3DxsfFMsG5BqTYdZV6EXFQI3f9917GjfxRCRslYuc9m
 Etxu4BonuYY/VCMILOoyvU/yUt4mKRBC5qjGZ/oVZi4ZOsLZrjmWNCg6EmArpuPXdx
 UIoQu++lCJCrdk5jovaAHaOen43XILBCHQRS6B/c=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Corentin Labbe <clabbe.montjoie@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 =?UTF-8?q?Horia=20Geant=C4=83?= <horia.geanta@nxp.com>,
 Aymen Sghaier <aymen.sghaier@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Date: Thu, 10 Sep 2020 21:29:16 +0200
Message-Id: <20200910192919.12503-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Cc: Iuliana Prodan <iuliana.prodan@nxp.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Subject: [Linux-stm32] [PATCH v2 1/4] crypto: caam - Fix kerneldoc
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Fix kerneldoc warnings like:

  drivers/crypto/caam/caamalg_qi2.c:73: warning: cannot understand function prototype: 'struct caam_ctx'
  drivers/crypto/caam/caamalg_qi2.c:2962: warning: cannot understand function prototype: 'struct caam_hash_ctx'
  drivers/crypto/caam/ctrl.c:449: warning: Function parameter or member 'ctrl' not described in 'caam_get_era'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. Fix more warnings
---
 drivers/crypto/caam/caamalg_desc.c |  1 +
 drivers/crypto/caam/caamalg_qi2.c  |  4 ++--
 drivers/crypto/caam/ctrl.c         |  4 +++-
 drivers/crypto/caam/jr.c           | 10 +++++-----
 4 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/crypto/caam/caamalg_desc.c b/drivers/crypto/caam/caamalg_desc.c
index d6c58184bb57..f0f0fdd1ef32 100644
--- a/drivers/crypto/caam/caamalg_desc.c
+++ b/drivers/crypto/caam/caamalg_desc.c
@@ -373,6 +373,7 @@ EXPORT_SYMBOL(cnstr_shdsc_aead_encap);
  *         with OP_ALG_AAI_HMAC_PRECOMP.
  * @ivsize: initialization vector size
  * @icvsize: integrity check value (ICV) size (truncated or full)
+ * @geniv: whether to generate Encrypted Chain IV
  * @is_rfc3686: true when ctr(aes) is wrapped by rfc3686 template
  * @nonce: pointer to rfc3686 nonce
  * @ctx1_iv_off: IV offset in CONTEXT1 register
diff --git a/drivers/crypto/caam/caamalg_qi2.c b/drivers/crypto/caam/caamalg_qi2.c
index 66ae1d581168..0441e4ff2df2 100644
--- a/drivers/crypto/caam/caamalg_qi2.c
+++ b/drivers/crypto/caam/caamalg_qi2.c
@@ -59,7 +59,7 @@ struct caam_skcipher_alg {
 };
 
 /**
- * caam_ctx - per-session context
+ * struct caam_ctx - per-session context
  * @flc: Flow Contexts array
  * @key:  [authentication key], encryption key
  * @flc_dma: I/O virtual addresses of the Flow Contexts
@@ -2951,7 +2951,7 @@ enum hash_optype {
 };
 
 /**
- * caam_hash_ctx - ahash per-session context
+ * struct caam_hash_ctx - ahash per-session context
  * @flc: Flow Contexts array
  * @key: authentication key
  * @flc_dma: I/O virtual addresses of the Flow Contexts
diff --git a/drivers/crypto/caam/ctrl.c b/drivers/crypto/caam/ctrl.c
index 65de57f169d9..f7adcf6ecea5 100644
--- a/drivers/crypto/caam/ctrl.c
+++ b/drivers/crypto/caam/ctrl.c
@@ -444,7 +444,9 @@ static int caam_get_era_from_hw(struct caam_ctrl __iomem *ctrl)
  * by u-boot.
  * In case this property is not passed an attempt to retrieve the CAAM
  * era via register reads will be made.
- **/
+ *
+ * @ctrl:	controller region
+ */
 static int caam_get_era(struct caam_ctrl __iomem *ctrl)
 {
 	struct device_node *caam_node;
diff --git a/drivers/crypto/caam/jr.c b/drivers/crypto/caam/jr.c
index bf6b03b17251..6f669966ba2c 100644
--- a/drivers/crypto/caam/jr.c
+++ b/drivers/crypto/caam/jr.c
@@ -324,7 +324,7 @@ EXPORT_SYMBOL(caam_jr_alloc);
 
 /**
  * caam_jr_free() - Free the Job Ring
- * @rdev     - points to the dev that identifies the Job ring to
+ * @rdev:      points to the dev that identifies the Job ring to
  *             be released.
  **/
 void caam_jr_free(struct device *rdev)
@@ -349,15 +349,15 @@ EXPORT_SYMBOL(caam_jr_free);
  *        of this request. This has the form:
  *        callback(struct device *dev, u32 *desc, u32 stat, void *arg)
  *        where:
- *        @dev:    contains the job ring device that processed this
+ *        dev:     contains the job ring device that processed this
  *                 response.
- *        @desc:   descriptor that initiated the request, same as
+ *        desc:    descriptor that initiated the request, same as
  *                 "desc" being argued to caam_jr_enqueue().
- *        @status: untranslated status received from CAAM. See the
+ *        status:  untranslated status received from CAAM. See the
  *                 reference manual for a detailed description of
  *                 error meaning, or see the JRSTA definitions in the
  *                 register header file
- *        @areq:   optional pointer to an argument passed with the
+ *        areq:    optional pointer to an argument passed with the
  *                 original request
  * @areq: optional pointer to a user argument for use at callback
  *        time.
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
