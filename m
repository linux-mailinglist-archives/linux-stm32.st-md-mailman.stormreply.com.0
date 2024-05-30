Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B085F8D4B80
	for <lists+linux-stm32@lfdr.de>; Thu, 30 May 2024 14:25:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 779DBC6DD72;
	Thu, 30 May 2024 12:25:07 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9475AC6C859
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 May 2024 12:25:05 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44UCOevS073964;
 Thu, 30 May 2024 07:24:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1717071880;
 bh=9L+vI9mpqteE4RtnIqd2nlMIeDRwSOPZbKRlca9fqSA=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=pfW6M+RBWStqYgJ5SD2UfQ+DTbMzLAA8AmrXndPkklpbxsocfB0yUCo6jmHLJX2j3
 xnvE+EwHCujw98/kRPgp3OWNBJUF8SYz5bp6G+vt4yOsbOOZxqr3tmqB3NEyvqHUG0
 gsd0E+S1IGc8uj50E+X6jzjRSuRqN7sKokFe0rHc=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44UCOe2i094840
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 30 May 2024 07:24:40 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 30
 May 2024 07:24:40 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 30 May 2024 07:24:40 -0500
Received: from localhost (kamlesh.dhcp.ti.com [172.24.227.123])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44UCOdFE070486;
 Thu, 30 May 2024 07:24:40 -0500
From: <kamlesh@ti.com>
To: <herbert@gondor.apana.org.au>, <kristo@kernel.org>, <will@kernel.org>
Date: Thu, 30 May 2024 17:54:23 +0530
Message-ID: <20240524-mcrc64-upstream-v3-1-24b94d8e8578@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240524-mcrc64-upstream-v3-0-24b94d8e8578@ti.com>
References: <20240524-mcrc64-upstream-v3-0-24b94d8e8578@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: robh@kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
 devicetree@vger.kernel.org, catalin.marinas@arm.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 Kamlesh Gurudasani <kamlesh@ti.com>, akpm@linux-foundation.org,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org, vigneshr@ti.com
Subject: [Linux-stm32] [PATCH v3 1/6] lib: add ISO 3309 model crc64
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

From: Kamlesh Gurudasani <kamlesh@ti.com>

Add the polynomial to the crc64 table generation, and provide a
generic library routine implementing the algorithm.

64-bit cyclic redundancy checks (CRC) according to the ISO 3309:1991
standard.

The ISO 3309:1991 64-bit CRC model parameters are as follows:
    Generator Polynomial: x^64 + x^4 + x^3 + x + 1
    Polynomial Value: 0x000000000000001B
    Initial value: 0x0000000000000000
    Reflected Input: False
    Reflected Output: False
    Xor Final: 0x0000000000000000

Signed-off-by: Kamlesh Gurudasani <kamlesh@ti.com>
---
 include/linux/crc64.h |  1 +
 lib/crc64.c           | 27 +++++++++++++++++++++++++++
 lib/gen_crc64table.c  |  6 ++++++
 3 files changed, 34 insertions(+)

diff --git a/include/linux/crc64.h b/include/linux/crc64.h
index e044c60d1e61..b791316f251c 100644
--- a/include/linux/crc64.h
+++ b/include/linux/crc64.h
@@ -10,6 +10,7 @@
 #define CRC64_ROCKSOFT_STRING "crc64-rocksoft"
 
 u64 __pure crc64_be(u64 crc, const void *p, size_t len);
+u64 __pure crc64_iso3309_generic(u64 crc, const void *p, size_t len);
 u64 __pure crc64_rocksoft_generic(u64 crc, const void *p, size_t len);
 
 u64 crc64_rocksoft(const unsigned char *buffer, size_t len);
diff --git a/lib/crc64.c b/lib/crc64.c
index 61ae8dfb6a1c..40369dd26812 100644
--- a/lib/crc64.c
+++ b/lib/crc64.c
@@ -22,6 +22,11 @@
  * x^24 + x^23 + x^22 + x^21 + x^19 + x^17 + x^13 + x^12 + x^10 + x^9 +
  * x^7 + x^4 + x + 1
  *
+ * crc64iso3309table[256] table is from the ISO-3309:1991 specification
+ * polynomial defined as,
+ *
+ * x^64 + x^4 + x^3 + x + 1
+ *
  * crc64rocksoft[256] table is from the Rocksoft specification polynomial
  * defined as,
  *
@@ -63,6 +68,28 @@ u64 __pure crc64_be(u64 crc, const void *p, size_t len)
 }
 EXPORT_SYMBOL_GPL(crc64_be);
 
+/**
+ * crc64_iso3309_generic - Calculate bitwise ISO3309 CRC64
+ * @crc: seed value for computation. 0 for a new CRC calculation, or the
+ *	 previous crc64 value if computing incrementally.
+ * @p: pointer to buffer over which CRC64 is run
+ * @len: length of buffer @p
+ */
+u64 __pure crc64_iso3309_generic(u64 crc, const void *p, size_t len)
+{
+	size_t i, t;
+
+	const unsigned char *_p = p;
+
+	for (i = 0; i < len; i++) {
+		t = ((crc >> 56) ^ (*_p++)) & 0xFF;
+		crc = crc64iso3309table[t] ^ (crc << 8);
+	}
+
+	return crc;
+}
+EXPORT_SYMBOL_GPL(crc64_iso3309_generic);
+
 /**
  * crc64_rocksoft_generic - Calculate bitwise Rocksoft CRC64
  * @crc: seed value for computation. 0 for a new CRC calculation, or the
diff --git a/lib/gen_crc64table.c b/lib/gen_crc64table.c
index 55e222acd0b8..abc860487463 100644
--- a/lib/gen_crc64table.c
+++ b/lib/gen_crc64table.c
@@ -17,9 +17,11 @@
 #include <stdio.h>
 
 #define CRC64_ECMA182_POLY 0x42F0E1EBA9EA3693ULL
+#define CRC64_ISO3309_POLY 0x000000000000001BULL
 #define CRC64_ROCKSOFT_POLY 0x9A6C9329AC4BC9B5ULL
 
 static uint64_t crc64_table[256] = {0};
+static uint64_t crc64_iso3309_table[256] = {0};
 static uint64_t crc64_rocksoft_table[256] = {0};
 
 static void generate_reflected_crc64_table(uint64_t table[256], uint64_t poly)
@@ -82,6 +84,9 @@ static void print_crc64_tables(void)
 	printf("static const u64 ____cacheline_aligned crc64table[256] = {\n");
 	output_table(crc64_table);
 
+	printf("\nstatic const u64 ____cacheline_aligned crc64iso3309table[256] = {\n");
+	output_table(crc64_iso3309_table);
+
 	printf("\nstatic const u64 ____cacheline_aligned crc64rocksofttable[256] = {\n");
 	output_table(crc64_rocksoft_table);
 }
@@ -89,6 +94,7 @@ static void print_crc64_tables(void)
 int main(int argc, char *argv[])
 {
 	generate_crc64_table(crc64_table, CRC64_ECMA182_POLY);
+	generate_crc64_table(crc64_iso3309_table, CRC64_ISO3309_POLY);
 	generate_reflected_crc64_table(crc64_rocksoft_table, CRC64_ROCKSOFT_POLY);
 	print_crc64_tables();
 	return 0;

-- 
2.34.1
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
