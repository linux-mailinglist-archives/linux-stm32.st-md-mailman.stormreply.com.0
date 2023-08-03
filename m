Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D26B576EED2
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Aug 2023 17:58:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 795BEC6B44B;
	Thu,  3 Aug 2023 15:58:02 +0000 (UTC)
Received: from sender-op-o13.zoho.in (sender-op-o13.zoho.in [103.117.158.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 561BFC6904B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Aug 2023 05:58:54 +0000 (UTC)
Delivered-To: manank@manank.me
ARC-Seal: i=1; a=rsa-sha256; t=1691042259; cv=none; d=zohomail.in; s=zohoarc; 
 b=dJicvY75PY0b3s4qKvKDaNKPSVb1wraRGk40M3JoXuruEbVD6M7s7vEZGTav3fxAH/CsLb4U5Ai3JsgcKqVpZhX++e0tZwOYAZev2gXGim3gD1U3bzWGnXjFZxPd3BNroOcRW+Gvdk1WSgS1QSyaZLNMu/6jXOAPnhS3pKiVQUc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1691042259;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=CadaJrF/rpy1sP8SKNRSh3x1dnJZ9rNtrtRhvLWUVUo=; 
 b=DKzP5IWMR8Ss5MLLHlGjlJ7RLl2BQ6YCBkCDhP1Z2fKn8ZZHW0a/PRJHCS2cyc+f+ww/rXzIrctrJLT6k1oo0ddyvGhmRrZl1DsyycPjluqEN4IcoJmP/EeGheK7hv0eUSTS3scdS8p2q9jVQ3tHb8Bpe3LbEhJ6MOCRL9RbXx8=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=manank.me;
 spf=pass  smtp.mailfrom=manank@manank.me;
 dmarc=pass header.from=<manank@manank.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1691042259; 
 s=zmail; d=manank.me; i=manank@manank.me;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
 bh=CadaJrF/rpy1sP8SKNRSh3x1dnJZ9rNtrtRhvLWUVUo=;
 b=XFT8k9iNY9SYcHfSZGAtltV6f+v2DZIlVQXImMUadmSwV4XiCBytU/pzXNw2ZBFC
 KrBoW0vHmF5sN8+Z4cWV1kXZC4spTvJBy0VQ73T1N8K9zEMin9nTsxDJ077PlKESPzW
 qgUOVmgRJRs4vqrNfkEqRfO9NtGRTziNws2V65NA=
Received: from localhost (103.176.11.243 [103.176.11.243]) by mx.zoho.in
 with SMTPS id 1691042257514977.3416243917786;
 Thu, 3 Aug 2023 11:27:37 +0530 (IST)
From: Manank Patel <manank@manank.me>
Date: Thu, 03 Aug 2023 11:27:30 +0530
MIME-Version: 1.0
Message-Id: <20230803-fix-typo-v1-1-b794378d594e@manank.me>
X-B4-Tracking: v=1; b=H4sIAMlBy2QC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2MDCwNj3bTMCt2SyoJ8XePkJCMDcyMLE2NDAyWg8oKiVKAc2Kjo2NpaAGm
 Gpy9aAAAA
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1211; i=manank@manank.me;
 h=from:subject:message-id; bh=0vIqaZEzzjbvukjGmjA1Gz79kmWmEraGb+GXgudYmls=;
 b=owF91lVUFAq7BuApZJChYWgpYVPCIDh0CUh3IyGNNDh0d4e0oCMCIgPoMDg0CNIjISAwEtKgE
 lKSEmefvda/zr75z+X3XrxX73rWl00BBkCBoUyVWlC9yk7gEJ8DwGlIeSycLqe8VxBEuUMjAR/0
 LXQYXOnwkCcF2LUzdLu+N+k7SaEyggCAUAo5OBfk29e/QmOfBTliRwL1/lNEAvrflmEbPsAzEAX
 E8cFTBSA1oJ21IWfcwPgXMxU/3W+m1zMpEeeLmpawlEYzY6m4Fn9IVujAr/2YTFv4QtdMLizmPC
 +BIw8rAL4YCS08VIExEUKOPr4ZMtp36WGv/fmtICMM6tQlOQsMWqN/uRc/Uf1Zj3HogjaWzISQK
 v9r1A3r0YCT3GAwPW1MBpTfTSvdw4rLYbpq2CKOTusN1JnJf8+UqXBQlLtdFDVPF7cly1zAJW/x
 xTyxbOPzDa14WunTAqxcXu+whJxHyk3WPOfANb5na+ZlPCeOhMColedpiqiE+vyupoVCUF15LhP
 ekVFT8sn32DDFiyc7KKXLGEPDMirAsecjHi6nfSOJzp949k+vCiTgGXe5OZzuvsWpmjRp2dyi4E
 8ue+OsK4UfFoWfKto/g5xiMjsQqBda32+cta9hm7P5OddIzN4JPjAkdt8s9EkxeiiugTEHHYTQd
 +XMN2yXRhb7A9q3Gx2G7TnuK3ZJ2FClmii++5SMhZpmbpCt9Qx+Dfdwcgi+fOUwmZx/4uq2KV5P
 0lEZcrH7GkVTjOzVF2wTchxsx6tPnzl/9xzD+tTEMR4FdJn97ut6Wc0jc+SOWuIxXec1Ze4szmS
 5HgtJ1uZpUrCTp8QOoXEiL06ou6UuazKu/3CQS/CIu52RT34GDecm/titD5g/OIaiMeaqD29lLQ
 y4d9gptc7/LJuJFd0H0AABQDy7rr23vbcHp4E9ytmTU87rn0vJ1StYxNHHSyEFZAihA0IBsiBWM
 Ak5GZQUdIPhJhmUHASBg8BA0C0giDH6v27O0Ra7AWIGAm6SUf8nJA5TXdKT6Ky11fltdGc+iBOU
 HZYqYLmCiVrZY3nd/YDgd4e4e1nEkS5Gmofrkm3qNl9qEqfzWH0WYgA4u2+Ppj+AYb4NLs1pQha
 V9FqqIliHCdHqw5gAbbENGr8GW+Tushs0UL+wa7Kc1LZV/nfC82PfYioVoyM42dcMrQypX100i7
 PMLdJ50l6ninqWCh5NUQI0CNk0O+/GKL2WokmdcCnu3tePZjXOvgfH2cec+/0uJGOesie8WvOp6
 RAQE39r6olJ7yWK8QwBpsBs3rJYKSadVRXhz8HRtWKz0V3dTXavxQj8Me0zhYzdHL6JWKdayeXh
 2TG9t6PJ6DuHuLqHC266nwAX8ikWzyqLLrLyp6KMLSO8bXGBFVEn4cAUDfnPN++sNbIYiZ9VtX2
 YellJzbgihbwk5vU83GEloSgq3/frDW35pVC1a6OnOzk65nWdSAjfMpzQVzyVKhnvjXQAFxvLqG
 +FHTNDRaxWz8dqWXZLvo6Olj05/AQKs4dvvsPoysgUoMOWFBmXR3V7qAS2POcUdhQYHinSNPK2s
 PFKiXZicgcG5vF9tV6DClWJ0gaq6PGI8z2bcpUWBbxhrNtW386zzOFM4eEM93ZhXyiWTHEiS7aD
 40iTK3IjL1zhdv5gXP0junW5P0U5A30Mk9czPSw9d4RCXdUKNweySsqIbNoc9Xz4lv8jaB8Vpc1
 Jau6aauej5Zbq+UPAEwwTxsxLGnLkLDWKvnNJ+sY5F/sqkEEQVLPjs1ggSrFr1j1ZV0EnFpCIfh
 Pyzk2S9KNm/yTgx3TLpBdcmPInjvFJ0g7h+9lAVD9/+XrZ60bTTbYCLcJIOMAmh8qbtW7s5bq7m
 2qKBM35S/1VTQP042gL/JKURM7b6wlK2RePiUS5CxAL98PmJyP3Uk1MBAk0GMuA0lU76DRQrH/d
 gyL6o91t26r699+NxhD3Wa7PG9zUd4/OrJZQDGrUTSmiC/qLMvKi2a1iV8py8KXSPkUG4S/Vtr8
 X20bCRtlAofbijMc3bY+Rjj7briGcClriSRq+GyXpzKlcdd1n98buwhNJm+6xlKV7dOKqrWNf+F
 2GFN2po4g1fMY4BjdfyLkPiLKH0EcFCRFXw+h4qJzMddnBDaqBJXMeeldDoFfqqCjjhWZ3yJN2T
 +mVoXmtWHF8mCEw+48Mw6vZ548z02BBC1qIjCecvUsuMQVqCLhYv/7tgg7sPW45FM1m0BDFgZPz
 VfYaLdI9w/p2Q53k8DY3M31VWAkDeHFt0iUq5TE9/2mM9FpEB05yKUKtKz0egWUQQ4HJ0/1AK4r
 cy/7OhEwqJMBJ4KQ8lMuP4XzSVBfT+Zdb9tCgrCWN3QIZkTwyg2HijEPmLlFpppFVTXFGs661X/
 YfglJASAjT38Zw/ndI/l4LiBX2b0gyJqiuQ13/aCAJ/O/4xfsYIxZDB/ahd8IH7Z/0ZCdD9+iFm
 BIOQOHeMCH3G1oVqRYQPJtyi/Xna5YsD5VqYqAoVMh9z7y76wjtI1X4jmcc42hPyK5YvZyo/pYM
 DjXzaEepBI/518ZevE09+ulSqJJxf9jZoL2Z3BfRzf6N7rdhyP1yzjkjoNcaxZT1QAZW0NyfnDS
 BsMHvQLzqZR31wGkXiydIJHvN1Dym0HgbkNT3HZi+QMxvoRxjpu5P+606ceH11KU4sGDCqhpWRT
 5EqXNwkMR1f7Ea7yQXfKFteDgXIi3FKVExQyYTzc+sfJUQv/oE/yZ+gw3WnLTmMTR/fWHJKjIvP
 W6vhKZ/ZL+vTog83Zw3eijXKNhnyB4wrW/F55q3SoF6cn4vzSdwjdZJO8xcVfuudDpXS6u9n4Fk
 qc8ywTie1U8VpsVc1TKn6HS89VlbBpdy+IE0oO35S8BkJhp+PPxRGxPmwsMh7JGarg6hnU8sHGf
 HuFeB7w3EnVGS7NjP3uhzeRM6RJ1mmRovHgke0RpqUadCNY4PX5CYKLG3DAVYS65IdCBkRsknf0
 CY75mFcLmaFe8Kahsd1K0sVCDjj4sMd986z4beLvij+EZ4v1f2KdqGtJjqyx/CfvoWXmbA3Isvr
 h+R4+lXIVVCLFolDfVGEH6ElOHXoc9tKTaRZgAr4X8gscX2UEMBeY+TOCgr0xFLqO+WOZ80SGE9
 r1QoJ2xnlBRe78F3Fanj5BrcQjQiXkWm3BDKjIBY9WuIiMi2IsOef2SJ0iZYYYLVXOXLrg3W0DF
 JyHJ7rvpoPvI+kfSnGV6iNbvRuwlZHbVXQij3IZf2o5gsCuADXsBKlPaWjLSm8u3iJZc+NaX+uP
 UH063+I1Wae3xp4IXV7pPoXBfGdT0R68LU3hc5p2WTCXQixr86IFY687c06+7jAXD101bFPYoAA
 x8XO8dFP2/HKocQR88xpYaVozaP+vhpZ5uF8Gt397PwU+SXCs7Y0Q5PGx8EscKK4XFM8X0W9pNA
 /fN8x2GGa7SGpabIAABMAgWk4lobeafUhrfbliOJ4tRwZWy6gtlEzRJ1rrmV874JvnDsG3pFI+f
 pACcHopQ28r3CjNgTDvQAmWx+Ql4t+yUC2rZsLeHkfXHsunZt5DJESXtcGPzX3TQ1tVQMyYwNZq
 qsZT08pmNxo+kSdsL6M4/rzhboeYVgK1GF3Diya2QdV58jqKvrxUtupNLbOswkTTIFx7uJCxSEF
 NVBUhUz474cebvo4oE9dJwdfG23IVycGMnmK4oFAX9bsAPpqbLzSLwX28wN1fnLKRc6kkRNh1Kp
 UfFCnduol9xojbczdI21iRs7NhHGlxJ9XAeMsoJDTY58sfy1uu81spac5AV4o2RTQHL/QML3/30
 kPX9DQkLmrHAA+Dcn3DXUgJdSfzZNpWvsJI3WBFnTR1B2dPQfM/e/U2k2lj2VZtw9xRlY5yHE3z
 tsf+ssC3nfPZ9iddt3f1P4grAx/TMZvdFJN/58gvMRbSMtxVWbiA6CN+yHedVyAY71o1LwtEZ2w
 fHL5ADMLYvf6FzTh/rVdk5HwuJjAyP9PWqSjU13gujfpXkqsETGx8fGy5eUx5u2e1QU5UWunhM/
 mya8kNmoq0HiNtv0n+vGWzF3K+GUzCYVAxLXa7yUreZevzAmUS36Md7o+qHVq01xP1NiV2D7jm6
 l8P6tkgbaoOxmY34K8LBRng4T5zTna37pvAa3DVerYGMALaf5cptA7MFXeYe/WooNtg5E7IOIgn
 7kSTo71UveoitvDMb15BgJnst6lrxdd92BXys0d76ObATn6ilG44Q/0yCdOM/0VxGzvvprmvkFC
 nInTpdezM5Cpe95fqPD6rdJulR25BLmMef00twDcSWvp6zJst0ck34Z+iiL33Wx+rDoLT5WO5fI
 49hKF45fcKy56EBZNDydVdwbEm0bvMsnoHk1l24SMznhfCLPamYQdLCMDIDzf2gOPfnw8UHu112
 2V7lmTWXSoeibDk5kY6QfXA91LLro1BDmUlvkw6nTbSywPZ8CyakbHLcstlP8XbPkd9Rg64fcCh
 yRykzJsQUjRr2lAftUDQmNzF3eE1cdRK7af+/BkJHq2lO0lFSfdckjN7+nSZ6ZPONqr6FE2TMpq
 MVaOLfEaNzRjrXuVisL/Wn3dSvFF7YM6i0n/egZWPDXnMx5pc4PI3/2UisN4oIxJoAMpvpAJX8H
 JtBjf8ociABWYnCUutP95DNf4ByqEJtSJtAv5El3VsTaxwqqzk0iwU8esjc16O+7MZjZMqdL7VQ
 9ysnm+VwHG3wk2xAOTjWm86wd4HozeKSkLVIayVlH/fhZVRItNHQJ6RnckRm7cNuEZ8+9HG+UbP
 5Nd8wdhHx6iBjYye4zvixxK7XJ+iS5KfTSFWKo8/NVKZZNF5jp378vHqGHzMxGvSYwRqXDBX605
 Ek5W+TMrSqQtRJFg6xpfMZI6JDVd4zDDOU3bgzkBOdGCylg2dX6BqHCn8zDP9QJdanPBob8qUwm
 xvgNdmIdAxtqJmJU3bePOjt/3klACRFqSrZW0EerDZnakRaIZJmhfdKrr9xGGL7rt6fkPWTuvHV
 RRSNqvCX5c9JL+VKnD9cQ7Clx8+1GItnNkDhMPK8Ys+aDIoaUEda0FRcs2buDMnCL8h+eEenNvW
 im03FXfoWbfnJra91axdEGAIKq/24pKB8nCT54XwrT+BXWXVGM9Zj+FFWos/Q2lupGkuDRkQC4H
 sl9uq05L8/A0vGDOxwn/yLP9wUtbHQErPfFop7ZAm0nwXIFzP0f
X-Developer-Key: i=manank@manank.me; a=openpgp;
 fpr=DDD8277A82997763AFCD764E7A18A64A084EA6BF
X-ZohoMailClient: External
X-Mailman-Approved-At: Thu, 03 Aug 2023 15:58:01 +0000
Cc: Manank Patel <manank@manank.me>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org,
 Jens Schleusener <Jens.Schleusener@fossies.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] tools: perf: pmu-events: Fix typo
	poiint->point
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

Fix typo in file floating-point.json in /arch/x86/westmereep-dp

Reported-by: Jens Schleusener <Jens.Schleusener@fossies.org>
Link: https://bugzilla.kernel.org/show_bug.cgi?id=205891
Signed-off-by: Manank Patel <manank@manank.me>
---
 tools/perf/pmu-events/arch/x86/westmereep-dp/floating-point.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/pmu-events/arch/x86/westmereep-dp/floating-point.json b/tools/perf/pmu-events/arch/x86/westmereep-dp/floating-point.json
index c03f8990fa82..196ae1d9b157 100644
--- a/tools/perf/pmu-events/arch/x86/westmereep-dp/floating-point.json
+++ b/tools/perf/pmu-events/arch/x86/westmereep-dp/floating-point.json
@@ -8,7 +8,7 @@
         "UMask": "0x1"
     },
     {
-        "BriefDescription": "X87 Floating poiint assists for invalid input value (Precise Event)",
+        "BriefDescription": "X87 Floating point assists for invalid input value (Precise Event)",
         "EventCode": "0xF7",
         "EventName": "FP_ASSIST.INPUT",
         "PEBS": "1",

---
base-commit: 5d0c230f1de8c7515b6567d9afba1f196fb4e2f4
change-id: 20230803-fix-typo-3cb207284310

Best regards,
-- 
Manank Patel <manank@manank.me>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
